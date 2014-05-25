package controllers

import play.api._
import play.api.mvc._
import play.api.libs.json._

object Application extends Controller {
  def index = Action {
    Ok(views.html.index())
  }
  
  def fibAction(fibSize:String) = Action {
    val arraySize = fibSize.toInt
    if(0 <= arraySize && arraySize <= 100){
      Ok(Json.toJson(fib.take(arraySize)))
    }else{
      BadRequest("Input value is at 0-100")
    }
  }
  
  val fib: Stream[JsNumber] = JsNumber(0) #:: JsNumber(1) #:: fib.zip(fib.tail).map(p => JsNumber(p._1.value + p._2.value))
  
  val flgList:List[String] = List("nomlFlg","numlFlg","tablFlg")
  
  def getDispFlg(dispFlg:String) = Action {
    if(flgList.contains(dispFlg)){
      Ok(Json.toJson(Dao.selectDispFlg(dispFlg)))
    }else{
      BadRequest("An incorrect value")
    }
  }
}

import anorm._
import play.api.db.DB
import play.api.Play.current

object Dao{
  def selectDispFlg(dispFlg:String):Seq[Boolean] = DB.withConnection{ implicit conn =>
    val resultSqlRowMap = SQL("Select * From disppatern Where name = '" + dispFlg + "' ").apply.apply(0).asMap
    val resultList = Seq(resultSqlRowMap.get("DISPPATERN.NOMLFLG").get ,resultSqlRowMap.get("DISPPATERN.NUMLFLG").get ,resultSqlRowMap.get("DISPPATERN.TABLFLG").get).map(f=>f.asInstanceOf[Some[Boolean]]).map(g=>g.get)
    return resultList
  }
}


package controllers

import play.api._
import play.api.mvc._
import play.api.libs.json._

object Application extends Controller {
  def index = Action {
    Ok(views.html.index())
  }
  
  def fibAction(fibSize:Int) = Action {
    if(0 <= fibSize && fibSize <= 100){
      Ok(Json.toJson(fib.take(fibSize)))
    }else{
      BadRequest("Input value is at 0-100")
    }
  }
  
  val fib: Stream[JsNumber] = JsNumber(0) #:: JsNumber(1) #:: fib.zip(fib.tail).map(p => JsNumber(p._1.value + p._2.value))
  
  val flgList:List[String] = List("normalFlg","numberFlg","colorFlg")
  
  def getDispFlgAction(dispFlg:String) = Action {
    if(flgList.contains(dispFlg)){
      val dispFlgList:Seq[JsBoolean] = Dao.selectDispFlg(dispFlg)
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
  def selectDispFlg(dispFlg:String):Seq[JsBoolean] = DB.withConnection{ implicit conn =>
    val resultSqlRowMap = SQL("Select normalflg,numberflg,colorflg From disppatern Where name = '" + dispFlg + "' ").apply.apply(0).asMap
    val resultList = Seq(resultSqlRowMap.get("DISPPATERN.NORMALFLG").get ,resultSqlRowMap.get("DISPPATERN.NUMBERFLG").get ,resultSqlRowMap.get("DISPPATERN.COLORFLG").get).map(f=>JsBoolean(f.asInstanceOf[Some[Boolean]].get))
    return resultList
  }
}


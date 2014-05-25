package controllers

import play.api._
import play.api.mvc._
import play.api.libs.json._

object Application extends Controller {
  def index = Action {
    Ok(views.html.index())
  }
  
  def fibAction(fibSize:String) = Action { 
    Ok(Json.toJson(fib.take(fibSize.toInt)))
  }
  
  val fib: Stream[JsNumber] = JsNumber(0) #:: JsNumber(1) #:: fib.zip(fib.tail).map(p => JsNumber(p._1.value + p._2.value))
  
  def getDispFlg(dispFlg:String) = Action {
    var resultDispFlg:Seq[Boolean] = Seq(false,true,false)
    resultDispFlg = Dao.selectDispFlg(dispFlg)
    Ok(Json.toJson(resultDispFlg))
  }
}

import anorm._
import play.api.db.DB
import play.api.Play.current

object Dao{
  def selectDispFlg(dispFlg:String):Seq[Boolean] = DB.withConnection{ implicit conn =>
    val url:String = "Select * From disppatern Where name = '" + dispFlg + "' "
    val resultStream:Stream[SqlRow] = SQL(url).apply
    val resultSqlRowMap =resultStream(0).asMap
    val nomlFlg = resultSqlRowMap.get("DISPPATERN.NOMLFLG").get
    val numlFlg = resultSqlRowMap.get("DISPPATERN.NUMLFLG").get
    val tablFlg = resultSqlRowMap.get("DISPPATERN.TABLFLG").get
    val resultList = Seq(nomlFlg ,numlFlg ,tablFlg).map(f=>f.asInstanceOf[Some[Boolean]]).map(g=>g.get)
    return resultList
  }
}





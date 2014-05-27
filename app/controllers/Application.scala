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
      Ok(Dao.selectDispFlg(dispFlg))
    }else{
      BadRequest("An incorrect value")
    }
  }
}
case class DispFlg(normalFlg:JsBoolean,numberFlg:JsBoolean,colorFlg:JsBoolean)

import anorm._
import play.api.db.DB
import play.api.Play.current

object Dao{
  def selectDispFlg(dispFlg:String):JsValue = DB.withConnection{ implicit conn =>
    return Json.toJson(
        SQL("Select normalflg,numberflg,colorflg From disppatern Where name = '" + dispFlg + "' ")().map(
            row => Map("normalFlg" ->JsBoolean(row[Boolean]("DISPPATERN.NORMALFLG")) ,
                "numberFlg" -> JsBoolean(row[Boolean]("DISPPATERN.NUMBERFLG")) ,
                "colorFlg" ->JsBoolean(row[Boolean]("DISPPATERN.COLORFLG")))).toList.apply(0))
  }
}


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

  def getDispFlgAction = Action {
      Ok(Dao.selectDispFlg)
  }
}

import anorm._
import play.api.db.DB
import play.api.Play.current

object Dao{
  def selectDispFlg:JsValue = DB.withConnection{ implicit conn =>
    val resultJsValueList:List[JsValue] =
        (SQL("Select id,normalflg,numberflg,colorflg From disppatern ORDER BY id ASC")().map(
            row => Json.obj(
                "normalFlg" -> row[Boolean]("DISPPATERN.NORMALFLG") ,
                "numberFlg" -> row[Boolean]("DISPPATERN.NUMBERFLG") ,
                "colorFlg" -> row[Boolean]("DISPPATERN.COLORFLG"))).toList
        )
    return Json.obj(
        "normal" -> resultJsValueList(0),
        "number" -> resultJsValueList(1),
	"color" -> resultJsValueList(2)
	)
  }
}
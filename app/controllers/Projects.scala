package controllers

import play.api._
import play.api.mvc._
import play.api.data._
import play.api.data.Forms._

import anorm._

import models._
import views._

/**
 * Other controller objects you create, such as this Projects object, should
 * extend Controller and Secured, as shown here.
 */
object Projects extends Controller with Secured {

  // IsAuthenticated is a method in Secured
  def index = IsAuthenticated { username => _ =>
    User.findByEmail(username).map { user =>
      Ok(
        html.dashboard(
          user
        )
      )
    }.getOrElse(Forbidden)
  }

}



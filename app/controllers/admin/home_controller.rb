# encoding: utf-8
class Admin::HomeController < Admin::BaseController
  skip_load_and_authorize_resource
  skip_authorization_check

  private

	  def init_breadcrumb
	  	super(:index => "后台首页")
	  end
end

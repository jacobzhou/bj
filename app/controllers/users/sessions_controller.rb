# encoding: utf-8
class Users::SessionsController < Devise::SessionsController
	
  skip_before_filter :verify_authenticity_token, :only => [:destroy]


  #layout false
  # def load_user_session
  # 	render :layout => false
  # end
end
# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  respond_to :html, :js, :json

  protect_from_forgery

  before_filter :store_location

  include Bootstrap::Breadcrumb
  #before_filter :init_breadcrumb, :except => :destroy
  before_filter :store_location
  
  protected
    def flash_msg(status = :notice, msg = "")
      flash[status] = msg
    end

    def init_breadcrumb(options = {})
      drop_breadcrumb params[:controller] , url_for(:action => params[:action]) 
    end

    def after_sign_out_path_for(resource_or_scope)
      request.referrer
    end

    def after_sign_in_path_for(resource)
      #UserMailer.welcome(current_user).deliver if current_user.admin? 
      params[:back].presence || session[:previous_url].presence || root_path
      #(current_user.admin? ? admin_path : root_path)
    end

    def store_location
      session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users|sign/
    end
end

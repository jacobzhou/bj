# encoding: utf-8
class Admin::BaseController < AuthorizedController
  before_filter :authenticate_admin!
  load_and_authorize_resource
  
  layout "admin"

  protected

    def authenticate_admin!
      raise CanCan::AccessDenied unless current_user.admin?
    end

    def init_breadcrumb(options = {})
      controller_str = params[:controller].gsub('/', '.').split('.')[1]
      #drop_breadcrumb t("breadcrumb.admin.home_page"), root_url
      yield if block_given?
      case params[:action]
      when 'create'
        params[:action] = 'new'
      when 'update'
        params[:action] = 'edit'
      when 'destroy'
        params[:action] = 'index'
      end
      drop_breadcrumb options[:index] || (t("models.#{controller_str.singularize}")<<"列表"), url_for(:action => :index)
      if params[:action] != 'index'
        drop_breadcrumb options[params[:action].to_sym] || t("breadcrumb.#{controller_str}.#{params[:action]}", :default => t("breadcrumb.defaults.#{params[:action]}")) , url_for(:action => params[:action]) 
      end
    end

    def respond_back(object, url = nil)
      params[:back] = url || eval("admin_#{object.class.to_s.tableize}_url") if params[:back].blank?
      respond_with :admin, object, :location => params[:back]
    end
end

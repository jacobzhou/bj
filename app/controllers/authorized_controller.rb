# -*- encoding : utf-8 -*-
class AuthorizedController < ApplicationController
  # devise方法验证用户登陆
  before_filter :authenticate_user! 
  
  # cancan方法效验用户权限 确保每一个action执行cancan
  # 跳过该验证skip_authorization_check
  #check_authorization
  # load_resource 自动生成@object = Obeject.find(params[:id])
  # authorize_resource 根據 CanCan::Ability 裡的權限表
  # 跳过该验证skip_load_and_authorize_resource,一般不是scaffold风格的controller都跳过。
  #load_and_authorize_resource

  # 捕获到cancan异常后跳转页面
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url #, :alert => exception.message
  # end
end

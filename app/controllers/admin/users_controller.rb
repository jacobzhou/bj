# encoding: utf-8
class Admin::UsersController < Admin::BaseController
 
  def index
    @users = User.page(params[:page]).per(30)
  end

  def new
  end

  def create
    @user = User.new(params[:user])
    flash_msg(:success) if @user.save
    respond_back(@user)
  end

  def update
    flash_msg(:success) if @user.update_attributes(params[:user])
    respond_back(@user)
  end

  def destroy
    flash_msg(:success) if @user.destroy
    respond_back(@user)
  end

end

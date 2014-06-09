# encoding: utf-8
class Admin::RolesController < Admin::BaseController
 
  def index
    @search = Role.metasearch(params[:search])
    @roles = @search.page(params[:page]).per(30)
  end

  def new
  end

  def create
    @role = Role.new(params[:role])
    flash_msg(:success) if @role.save
    respond_back(@role)
  end

  def update
    flash_msg(:success) if @role.update_attributes(params[:role])
    respond_back(@role)
  end

  def destroy
    flash_msg(:success) if @role.destroy
    respond_back(@role)
  end

end

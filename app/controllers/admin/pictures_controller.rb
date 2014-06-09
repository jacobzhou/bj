# encoding: utf-8
class Admin::PicturesController < Admin::BaseController

  def index
    @pictures = Picture.order("place, position DESC").page(params[:page]).per(30)
  end

  def new
  end

  def create
    @picture = Picture.new(params[:picture])
    flash_msg(:success) if @picture.save
    respond_back(@picture)
  end

  def update
    flash_msg(:success) if @picture.update_attributes(params[:picture])
    respond_back(@picture)
  end

  def destroy
    flash_msg(:success) if @picture.destroy
    respond_back(@picture)
  end
end

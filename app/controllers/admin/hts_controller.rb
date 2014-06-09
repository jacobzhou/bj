# encoding: utf-8
class Admin::HtsController < Admin::BaseController
  # lahtout 'template'
  def new
    @record = Record.find_by_id params[:record_id]
    @send_order = SendOrder.find_by_id params[:send_order_id]
    @ht = Ht.new(:send_order_id => params[:send_order_id], :record_id => params[:record_id],  :no => SecureRandom.hex(7), :sellers => @send_order.sellers, :aunts => @send_order.aunts)
  end

  def create
    @ht = Ht.new(params[:ht])
    @ht.user = current_user
    flash_msg(:success) if @ht.save
    respond_back @ht
  end

  def edit
    @record = @ht.record
    @send_order = @ht.send_order
  end

  def update 
    @ht.user = current_user
    @ht.update_attributes(params[:ht])
    respond_back @ht
  end
  
  def index
    @search = Ht.metasearch(params[:search])
    @hts = @search.order('created_at DESC').page(params[:page]).per(30)
  end

  def destroy
    flash_msg(:success) if @ht.destroy
    respond_back @ht
  end

end
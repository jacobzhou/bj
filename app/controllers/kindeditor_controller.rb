# encoding: utf-8
class KindeditorController < AuthorizedController
  protect_from_forgery :except => :upload
  #skip_authorization_check
  #skip_load_and_authorize_resource

  def upload
    @image = KindeditorImage.new(:data => params[:imgFile])
    if @image.save
      render :text => {"error" => 0, "url" => @image.data.url}.to_json
    else
      render  :text => {"error" => 1}
    end
  end
end

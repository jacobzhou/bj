# -*- encoding : utf-8 -*-
class CatalogsController < ApplicationController
  def show
    @catalog = Catalog.find(params[:id])
    @articles = @catalog.articles.page(params[:page]).per(1)
  end
end

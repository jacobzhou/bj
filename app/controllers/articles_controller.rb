# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @tag_articles = @article.tag_articles
  end

  def index
    @catalog = Catalog.find_by_id(params[:catalog_id]) || Catalog.first
    @articles = @catalog.articles.page(params[:page]).per(1)
  end
end

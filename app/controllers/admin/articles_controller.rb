# encoding: utf-8
class Admin::ArticlesController < Admin::BaseController
	# layout 'template'
	def new
    @article = Article.new(:published => true, :catalog_id => params[:catalog_id])
    1.times { @article.attachments.build(:lx => "头像") }
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash_msg(:success)
    else
      1.times { @article.attachments.build(:lx => "头像") } 
    end
    respond_back @article
  end

  def edit
    1.times { @article.attachments.build(:lx => "头像") } unless @article.cover
  end

  def update 
    @article.update_attributes(params[:article])
    respond_back @article
  end
  
  def index
    @search = Article.metasearch(params[:search])
    @articles = @search.includes([:catalog]).order('created_at DESC').page(params[:page]).per(30)
  end

  def destroy
    flash_msg(:success) if @article.destroy
    respond_back @article
  end

end
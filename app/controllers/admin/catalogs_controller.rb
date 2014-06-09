# encoding: utf-8
class Admin::CatalogsController < Admin::BaseController
	before_filter :authenticate_user!
	
	def index
		@catalogs = Catalog.roots
	end

  # 通用级联下拉框
  def selects
    clazz = params[:otype].to_s.singularize.camelize.constantize
    @objects = params[:id].blank? ? clazz.all : clazz.children_of(params[:id])
    if params[:otype].blank? or @objects.empty? or params[:id].blank?
      render :nothing => true
    else
      render :partial => "/shared/selects", :layout => false 
    end
  end

	def new
		@catalog = Catalog.new(:parent_id => params[:parent_id])
	end

	def edit
	end

	def create
		@catalog = Catalog.new(params[:catalog])
		flash_msg(:success) if @catalog.save
		respond_back @catalog
	end

	def update
		@catalog.update_attributes(params[:catalog])
    respond_back @catalog
	end

	def show
	end

	def destroy
		@catalog = Catalog.find(params[:id])
		if !@catalog.has_children? && @catalog.destroy
			flash_msg(:success)
		else
			flash_msg(:error, @catalog.errors.full_messages.join('；'))
		end
		respond_back @catalog
	end


	private
		def init_breadcrumb
			super  do 
				drop_breadcrumb t("models.article")<<"列表", admin_articles_url
			end
		end
end
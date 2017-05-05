class CategoryController < ApplicationController
   before_action :authenticate_user!
	def new
		@category=Category.new
	end

	def index
	
		@category=current_user.categories.all
	end

	def create
		
		@category=current_user.categories.new(category_params)
		if @category.save
			redirect_to categories_path
		else
			render :new
		end
	end

	def edit
		@category=current_user.categories.find(params[:id])
	
	end

	def destroy
		@category=current_user.categories.find(params[:id])
		@category.destroy
		redirect_to :back
	end

	def update
		@category=current_user.categories.find(params[:id])
		@update_category=@category.update(category_params)
		redirect_to  categories_path
	end
	private
		def category_params
			params.require(:category).permit(:name)
		end
end

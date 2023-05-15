class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice]="Category successfully created "
            redirect_to @category
        else
            render 'new'
        end
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page:2)
    end

    def show
        # binding.pry
        @category = Category.find(params[:id])
        # binding.pry

        @articles
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
    
    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert]= "Only admins can perform this action"
            redirect_to categories_path
        end
    end
end

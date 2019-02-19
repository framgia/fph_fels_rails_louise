class CategoriesController < ApplicationController

    def index
        @categories = Category.paginate(page: params[:page], per_page:8).where("EXISTS(SELECT 1 from words where categories.id = words.category_id)")
    end
end

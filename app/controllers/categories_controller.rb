class CategoriesController < ApplicationController

    def index
        @categories = Category.paginate(page: params[:page], per_page:8).has_words
    end
end

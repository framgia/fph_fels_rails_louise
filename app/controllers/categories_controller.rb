class CategoriesController < ApplicationController
    before_action :logged_in_user, only: [:index]
    def index
        @categories = Category.paginate(page: params[:page], per_page:8).has_words
        if params[:learned] == "1"
            @categories = current_user.categories.paginate(page: params[:page], per_page:8)
        elsif params[:learned] == "0"
            @categories = @categories.where.not(id: current_user.category_ids).paginate(page: params[:page], per_page:8)
        end
    end
end

class WordsController < ApplicationController
  def index
    @answers = current_user.group_answer(params).paginate(page: params[:page], per_page:10)
  end
end

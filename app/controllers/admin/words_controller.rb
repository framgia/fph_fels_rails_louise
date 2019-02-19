class Admin::WordsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index, :edit, :update, :destroy]
  
  def index
    @category = Category.find_by_id(params[:category_id])
    @words = @category.words.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @word = Word.new
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find_by_id(params[:category_id]) 
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Word created!"
      redirect_to admin_category_words_url
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by_id(params[:category_id])
    @word = Word.find(params[:id])
  end
      
  def update
    @word = Word.find(params[:id])
    @choices = @word.choices
    if @word.update_attributes(word_params)
      flash[:success] = "Word updated!"
      redirect_to admin_category_words_url
    else
      render 'new'
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = "Word deleted!"
    redirect_to admin_category_words_url
  end  

  private
    def word_params
      params.require(:word).permit(:word, choices_attributes: [:content, :correct, :id])
    end

end

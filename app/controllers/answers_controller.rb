class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update]
  
  def new
    @lesson = Lesson.find_by_id(params[:lesson_id])
    @specific_word = (@lesson.category.words - @lesson.words).try(:first)

    if @specific_word.blank?
      @lesson.update_attributes(score: @lesson.get_correct.count)
      redirect_to lesson_url(@lesson)
    else
      @answer = @lesson.answers.build(word: @specific_word)
    end
  end

  def create
    @lesson = Lesson.find_by_id(params[:lesson_id])
    if @lesson.answers.create(answer_params)
      redirect_to new_lesson_answer_url(@lesson)      
    end
  end 

  def update
      if @lesson.answers.size - 1
        redirect_to [@lesson, @lesson.answers[@lesson.answers.index(answer)+1]]
      else
        @lesson.update(score: @lesson.get_correct.count)
      end
  end

  private
    def answer_params
      params.require(:answer).permit(:word_id, :choice_id)
    end
  
end

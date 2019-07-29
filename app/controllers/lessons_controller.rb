class LessonsController < ApplicationController

  before_action :logged_in_user

  def new
    @category = Category.find_by_id(params[:category_id])
    @lesson = Lesson.new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)

    if @category.words.any? 
      if @lesson.save
        redirect_to new_lesson_answer_url(@lesson)
      else 
        render 'new'
      end
    else
      flash[:danger] = "No words"
      redirect_to categories_url
    end
  end 

  def show
    @lesson = Lesson.find(params[:id])
  end
end

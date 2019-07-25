class LessonsController < ApplicationController

  before_action :logged_in_user

  def new
    @category = Category.find_by_id(params[:category_id])
    @lesson = Lesson.new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(lesson_params)
      if @lesson.save
        flash[:success] = "Lesson Created"
        redirect_to new_category_lesson_url(@category)
      else 
        render 'new'
      end
  end 

  private
  def lesson_params
    params.require(:lesson).permit(:user_id, :category_id)
  end

end

class AnswersController < ApplicationController

  before_action :logged_in_user

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
    word_length = @lesson.answers.length
    @lesson.category.words.each do |word|
      unless @lesson.answers.where(word_id: word.id).exists?
        @word = word 
        @progress = word_length + 1
        break
      end
    end

    if @word.nil?
      score = @lesson.answers.collect {|answer| answer.choice.correct}.count(true)
      @lesson.update_attribute(:score, score)
      @lesson.create_activity(user: current_user)
      redirect_to @lesson
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.create(answer_params)
    redirect_to new_lesson_answer_url(@lesson)
  end

  private
    def answer_params
      params.require(:answer).permit(:word_id, :choice_id)
    end
end
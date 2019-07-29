class WordsController < ApplicationController

  before_action :logged_in_user
  
  def index
    @user = User.find(current_user.id)
    @answers = @user.answers
  end
end

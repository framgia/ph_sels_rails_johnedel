class StaticPagesController < ApplicationController
  def home
    begin
      user = User.find(current_user.id)
      @activities = Activity.where("user_id IN (?) OR user_id = ?", user.following_ids, user.id).paginate(page: params[:page], per_page:10)
    rescue 
    end
  end
end

class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @likes = @user.likes.limit(10).order("created_at DESC") 
  end

end

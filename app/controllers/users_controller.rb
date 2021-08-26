class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @clubs = @user.like_clubs
  end

  def edit
  end

  def update
  end
end

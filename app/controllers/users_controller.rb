class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @clubs = @user.like_clubs
  end

  def edit
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
  end

  def update
  end
end

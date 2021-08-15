class ClubsController < ApplicationController
  before_action :authenticate_user!, except: :index




  def index
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def club_params
    params.require(:club).permit(:image, :name, :status_id, :since_year, :since_month, :prefecture_id, :city, :gym, :gender_ratio, :beginner_ratio, :age_range, :purpose, :homepage, :information).merge(user_id: current_user.id)
  end

end

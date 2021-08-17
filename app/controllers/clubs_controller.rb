class ClubsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_club, only: :show



  def index
    @clubs = Club.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def club_params
    params.require(:club).permit(:image, :name, :status_id, :since_year, :since_month, :prefecture_id, :city, :gym, :gender_ratio, :beginner_ratio, :age_range, :purpose, :homepage, :information).merge(user_id: current_user.id)
  end

  def set_club
    @club = Club.find(params[:id])
  end


end

class ClubsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_show, only: :new


  def index
    @clubs = Club.includes(:user).order("created_at DESC")
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
  end

  def search
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
    @q = Club.ransack(params[:q])
    @clubs_result = @q.result(distinct: true)
    @clubs = @clubs_result.page(params[:page])
    if @q.prefecture_id_eq.present?
      @prefecture = Prefecture.find(@q.prefecture_id_eq)
    end
    
    if @q.city_id_eq_any.present?
      @q.city_id_eq_any.each do |city_id|
        @city = City.find(city_id)
        @cities = []
        @cities.push(@city)
      end
      @cities_id = revive_active_record(@cities)
    end
    
  end

  def new
    @club = Club.new
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to new_club_want_path(@club)
    else
      render :new
      gon.prefectures = Prefecture.all.to_json only: %i[id name]
    end
  end

  def show
    @events = Event.where(club_id: params[:id])
  end

  def edit
    gon.prefectures = Prefecture.all.to_json only: %i[id name]
  end

  def update
    if @club.update(club_params)
      redirect_to club_path
    else
      render :edit
      gon.prefectures = Prefecture.all.to_json only: %i[id name]
    end
  end

  def destroy
    @club.destroy
    redirect_to root_path
  end

  private
  def club_params
    params.require(:club).permit({images: []} , :name, :status_id, :since_year, :since_month, :prefecture_id, :city_id, :gym, :action_time, :fee, :persons, :age_range, :gender_ratio, :beginner_ratio, :purpose, :email, :homepage, :information).merge(user_id: current_user.id)
  end

  def set_club
    @club = Club.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @club.user_id
  end

  def move_to_show
    redirect_to club_path(current_user.club) if user_signed_in? &&  current_user.club.present?
  end

  # def search_params
    # params.require(:q).permit(:wants_sex_ids_eq_any, :wants_age_ids_eq_any, :wants_level_ids_eq_any)
  # end

  def revive_active_record(arr)
    arr.first.class.where(id: arr.map(&:id))
  end


end

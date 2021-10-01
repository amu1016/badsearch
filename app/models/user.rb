class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_one :club
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_clubs, through: :likes, source: :club
  belongs_to :prefecture


  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :gender


  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


  def own?(object)
    id == object.user_id
  end

  def like(club)
    likes.find_or_create_by(club: club)
  end

  def like?(club)
    like_clubs.include?(club)
  end

  def unlike(club)
    like_clubs.delete(club)
  end
end

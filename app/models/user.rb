class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :personalized_trainers, dependent: :destroy
  has_many :bookings
  # validations for user attributes?
  has_many :conversations, foreign_key: :sender_id

  has_one_attached :photo
end

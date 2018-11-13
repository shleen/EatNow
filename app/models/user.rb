class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: %i[customer owner employee admin]
  has_many :orders
  # has_many :cards
  has_many :favourite_items
  has_many :ratings
end

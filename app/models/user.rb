class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable,
  :trackable, :lockable, :confirmable, :timeoutable


  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders, :history]

  # VALIDATIONS
  validates :username, uniqueness: true, length: { minimum: 1, maximum: 100 }

end

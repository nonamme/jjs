class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :courses, foreign_key: 'owner_id'
  has_many :subscriptions, foreign_key: 'participant_id'
  has_many :courses, through: :subscriptions, foreign_key: 'participant_id'
end

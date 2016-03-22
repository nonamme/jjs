class Course < ActiveRecord::Base
  has_one :course_category
  has_many :chapters
  belongs_to :owner, class_name: "User"
  has_many :subscriptions
  has_many :participants, through: :subscriptions, source: "User"
end

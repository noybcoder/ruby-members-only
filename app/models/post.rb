class Post < ApplicationRecord
  belongs_to :member
  validates :title, presence: true, uniqueness: true, length: { in: 20...60 }
  validates :body, presence: true, uniqueness: true, length: { in: 15...500 }
  validates :member_id, presence: true, numericality: { only_integer: true }
end

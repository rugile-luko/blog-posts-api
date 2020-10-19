class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 4}
  scope :by_q, -> (q) { where("body like ?", "%#{q}%") if q.present? }
end

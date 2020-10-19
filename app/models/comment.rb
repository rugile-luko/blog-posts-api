class Comment < ApplicationRecord
  # id
  belongs_to :user # user_id
  belongs_to :post # post_id
end

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :subscribed_user
end

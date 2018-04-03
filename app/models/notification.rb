# == Schema Information
#
# Table name: notifications
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  notified_by_id :integer
#  post_id        :integer
#  identifier     :integer
#  notice_type    :string
#  read           :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Notification < ApplicationRecord
  validates :user_id, :notified_by_id, :post_id, :notice_type, presence: true
  
  belongs_to :user
  belongs_to :post
  belongs_to :notified_by, class_name: 'User'
end

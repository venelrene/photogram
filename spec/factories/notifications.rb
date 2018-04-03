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

FactoryBot.define do
  factory :notification do
    user nil
    post nil
    read false
    subscribed_user nil
    identifier 1
    type ""
  end
end

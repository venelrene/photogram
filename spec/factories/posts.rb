# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  caption            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  user_id            :integer
#

FactoryBot.define do
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/dragon.jpg', 'image/jpg')
  end
end

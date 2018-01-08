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

class Post < ApplicationRecord
  validates :image, presence: true
  validates :user_id, presence: true

  has_attached_file :image, styles: { medium: "640x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user

end

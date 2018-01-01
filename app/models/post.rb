# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :image, presence: true

  has_attached_file :image
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/




end

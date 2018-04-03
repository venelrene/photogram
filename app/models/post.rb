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

  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :image, presence: true
  validates :user_id, presence: true
  validates :caption, length: { minimum: 3, maximum: 300 }

  has_attached_file :image,
                    :storage => :cloudinary,
                    styles: { medium: "640x" },
                    :path => ':id/:style/:filename'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/




end

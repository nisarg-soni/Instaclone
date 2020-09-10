class Post < ApplicationRecord
    validates :image, presence: true

  has_attached_file :image, styles: { :square => "500x500!" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

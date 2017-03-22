class Book < ApplicationRecord
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/books_square.jpg"
  has_many :comments
  has_many :future_readers, through: :users
  has_many :readers, through: :users

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :published_at, presence: true
end

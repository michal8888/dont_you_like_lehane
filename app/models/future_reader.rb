# USERS WHICH HAVE SPECIFIC BOOK ON WISHLIST
class FutureReader < ApplicationRecord
  extend ReadersUsers
  
  belongs_to :book
  belongs_to :user
  validates_uniqueness_of :book_id, scope: [:user_id]
end

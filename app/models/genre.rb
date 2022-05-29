class Genre < ApplicationRecord
  belongs_to :admin

  validates :genre, presence: true
end

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :
  has_many :cart_items
  has_many :orders
  has_many :addresses

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
end

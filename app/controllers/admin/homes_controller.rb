class Admin::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @orders = Order.all

  end
end

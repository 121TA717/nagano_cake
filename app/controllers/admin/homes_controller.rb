class Admin::HomesController < ApplicationController
  def top
    @genre = Genre.all
    @order = Order.all

  end
end

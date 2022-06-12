class Public::AddressesController < ApplicationController
  def index
    @address = Address.all
  end

  def edit
    @address = Address.all
  end

  def create
    @address = Address.new(item_params)
    @address.save
    redirect_to public_addresses_path(@address.id)

  end

  def update
  end

  def destroy
    redirect_to public_addresses_path

  end
end

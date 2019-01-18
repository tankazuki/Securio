class ManufacturersController < ApplicationController

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:manufacturer_name)
  end
end

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
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    redirect_to admin_manufacturer_index_path
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:manufacturer_name)
  end
end

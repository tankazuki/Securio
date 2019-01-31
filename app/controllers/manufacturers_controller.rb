class ManufacturersController < ApplicationController

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:success] = "メーカーの登録が完了しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.update(manufacturer_params)
    if @manufacturer.save
      flash[:success] = "メーカーの編集が完了しました"
      redirect_to admin_manufacturer_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    flash[:success] = "メーカーの削除が完了しました"
    redirect_to admin_manufacturer_index_path
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:manufacturer_name)
  end
end

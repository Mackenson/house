class HousesController < ApplicationController
  def new
    @house = House.new
  end

  def create
    @house = House.new(houses_params)
    if @house.save
      redirect_to @house, notice: "House added successfully"
    else
      flash[:message] = @house.errors.full_message
      render :new
    end
  end

  def show
    @house = House.find(params[:id])
  end

  def houses_params
    params.require(:house).permit(:name, :author, :source, :motto)
  end
end

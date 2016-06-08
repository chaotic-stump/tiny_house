class CottagesController < ApplicationController
  before_action :city
  before_action :cottage, only: [:show, :edit, :update, :destroy]

  def index
    @cottages = @city.cottages
  end

  def show
  end

  def new
    @cottage = Cottage.new
  end

  def create
    @cottage = @city.cottage.new(cottage_params)
    if @cottage.save
      flash[:success] = "#{@cottage.name} created!"
      redirect_to city_cottage_path(@city, @restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cottage.update(cottage_params)
      flash[:success] = "Cottage #{cottage.name} successfully updated!"
      redirect_to city_cottage_path(@city, @restaurant)
    else
      render :edit
    end
  end

  def destroy
    name = @cottage.name
    @cottage.destroy
    flash[:success] = "Cottage with name #{name} deleted!"
  end

  private
    def cottage_params
      params.require(:cottage).permit(:name, :color, :sq_footage, :price)
    end

    def cottage
      @cottage = @city.cottages.find(params[:id])
    end

    def city
        @city = City.find(params[:city_id])
    end
end

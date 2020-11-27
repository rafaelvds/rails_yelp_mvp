class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit]
  # A visitor can see the list of all restaurants.
  # GET "restaurants"
  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  # A visitor can add a new restaurant, and be redirected to the show view of
  # that new restaurant.
  # GET "restaurants/new"
  # POST "restaurants"
  def new
    @restaurant = Restaurant.new
  end

  def edit; end

  # A visitor can see the details of a restaurant, with all the reviews related
  # to the restaurant.
  # GET "restaurants/id"
  def show; end

  # a visitor cannot update / delete any restaurant or review. This is the role
  # of the admin (i.e. you) - as a developer you have the power to manipulate the
  # DB from the rails console if you want to update / delete any record.
  # def update
  # PATCH  /restaurants/:id(.:format)      restaurants#update
  # end

  # def destroy
  # DELETE /restaurants/:id(.:format)      restaurants#destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end

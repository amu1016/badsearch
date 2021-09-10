class CitiesController < ApplicationController
  def set_cities
    cities = Prefecture.find(params[:id]).cities
    render json: cities.all.to_json(only: %i[id name])
  end
end

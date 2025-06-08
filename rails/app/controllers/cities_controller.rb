class CitiesController < ApplicationController
  PER_PAGE = 20

  def index
    @cities = City.includes(:state).limit(PER_PAGE).offset(rand(1..49) * PER_PAGE)
  end
end

class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end
end

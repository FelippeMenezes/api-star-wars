class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end
end

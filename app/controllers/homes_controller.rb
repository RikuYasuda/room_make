class HomesController < ApplicationController
  def top
    @rooms = Room.all
  end

  def show
    @rooms = Room.all
  end
end

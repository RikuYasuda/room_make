class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @user = current_user
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user

    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
    tags = Vision.get_image_data(@room.image)
    tags.each do |tag|
      @room.tags.create(name: tag)
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private

  def room_params
    params.require(:room).permit(:title, :image, :body)
  end
end

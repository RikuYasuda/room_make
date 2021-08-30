class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(room_id: params[:room_id])
    @room = Room.find(params[:room_id])
  end

  def destroy
    @like = Like.find_by(room_id: params[:room_id], user_id: current_user.id)
    @like.destroy
    @room = Room.find(params[:room_id])
  end
end

class RoomsController < ApplicationController
  def index
    is_reserved = params[:reserved]
    branch_id = params[:branch_id]
    
    room_query = Room.order(:id).includes(:branch).all
    room_query = room_query.where(reserved: (is_reserved == 'true')) if is_reserved.present?
    room_query = room_query.where(branch_id:) if branch_id.present?

    render json: room_query, include: { branch: {} }, except: [:branch_id]
  end

  def show
    room = Room.includes(:branch).find(params[:id])
    render json: room, include: { branch: {} }, except: [:branch_id]
  end

  def create
    room = Room.new(room_params)

    if room.save
      render json: room, status: :created
    else
      render json: room.errors, status: :unprocessable_entity
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    head :no_content
  end

  private

  def room_params
    params.require(:room).permit(:name, :guest, :beds, :description, :photo, :cost, :reserved, :branch_id)
  end
end

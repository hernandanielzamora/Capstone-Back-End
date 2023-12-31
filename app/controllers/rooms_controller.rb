class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    is_reserved = params[:reserved]
    received_branch_id = params[:branch_id]

    room_query = Room.order(:id).includes(:branch).all
    room_query = room_query.where(reserved: (is_reserved == 'true')) if is_reserved.present?
    room_query = room_query.where(branch_id: received_branch_id) if received_branch_id.present?

    render json: room_query, include: { branch: {} }, except: [:branch_id]
  end

  def show
    room = Room.includes(:branch).find(params[:id])
    render json: room, include: { branch: {} }, except: [:branch_id]
  end

  def create
    if current_user.role == 'admin'
      room = Room.new(room_params)

      if room.save
        render json: room, status: :created
      else
        render json: room.errors, status: :unprocessable_entity
      end
    else
      render json: 'Access not allowed !'
    end
  end

  def destroy
    if current_user.role == 'admin'
      room = Room.find(params[:id])
      room.destroy
      head :no_content
    else
      render json: 'Access not allowed !'
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :guest, :beds, :description, :photo, :cost, :reserved, :branch_id)
  end
end

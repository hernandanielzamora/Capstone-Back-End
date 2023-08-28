class ReservationsController < ApplicationController
  before_action :set_user
  before_action :set_reservation, only: %i[show destroy]

  def index
    @reservations = @user.reservations.includes(:rooms)
    render json: @reservations, include: { rooms: {} }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      @reservation.rooms.each { |room| room.update(reserved: true) }
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @reservation, include: { rooms: {} }
  end

  def destroy
    @reservation.rooms.each { |room| room.update(reserved: false) }
    @reservation.destroy

    if @reservation.destroy
      head :no_content
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :city, :total_cost, :user_id, room_ids: [])
  end
end
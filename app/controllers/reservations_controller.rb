class ReservationsController < ApplicationController
  before_action :set_user
  before_action :set_reservation, only: %i[show update destroy]

  def index
    @reservations = @user.reservations
    render json: @reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @rooms = @reservation.reservation_rooms.find(params[:room_ids])

    if @reservation.save
      @rooms.each { |room| room.update(reserved: true) }
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @reservation
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    @rooms = @reservation.reservation_rooms.room_ids

    if @reservation.destroy
      @rooms.each { |room| room.update(reserved: false) }
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
    params.require(:reservation).permit(:reservation_date, :city, :total_cost, :user_id)
  end
end

class ReservationsController < ApplicationController
  before_action :set_user
  before_action :set_reservation, only: [:show, :update, :destroy]

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
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

# coding: utf-8

class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all
    @rooms = Room.where(user_id: current_user)
  end

  def new
    @booking = Booking.new
    Booking.create(user_id: current_user.id, room_id: params[:room_id])
  end

  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      redirect_to @booking, notice: "予約が完了しました。"
    else
      flash.notice = "予約に失敗しました。"
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

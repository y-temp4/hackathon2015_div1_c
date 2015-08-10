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
    redirect_to rooms_path
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

  def auth
    @applicant=[]
    Booking.where(:room_id => params[:id]).each do |booking|
      @applicant << User.find(booking.user_id)
    end

    @approved=[]
    Booking.where(:room_id => params[:id], :approval => true).each do |booking|
      @approved << User.find(booking.user_id)
    end
  end

  def update_user
    if params[:check_id] == 0
      Booking.where(:user_id => params[:user_id], :room_id => params[:room_id])
             .first
             .update_attribute(:approval, true)
      redirect_to auth_booking_path(params[:room_id])
    else
      Booking.where(:user_id => params[:user_id], :room_id => params[:room_id])
             .first
             .update_attribute(:approval, true)
      redirect_to auth_booking_path(params[:room_id])
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

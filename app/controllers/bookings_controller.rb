# coding: utf-8

class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.order(:id).where(user_id: current_user.id)
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
    Booking.where(:room_id => params[:id], :approval => nil).each do |booking|
      @applicant << User.find(booking.user_id)
    end

    @approved=[]
    Booking.where(:room_id => params[:id], :approval => true).each do |booking|
      @approved << User.find(booking.user_id)
    end

    @disapproved=[]
    Booking.where(:room_id => params[:id], :approval => false).each do |booking|
      @disapproved << User.find(booking.user_id)
    end
  end

  def update_user
    if params[:check_id] == '0'
      b = Booking.where(:user_id => params[:user_id], :room_id => params[:room_id])
             .first
      b.approval = false
      b.save
      redirect_to auth_booking_path(params[:room_id])
    else
      b = Booking.where(:user_id => params[:user_id], :room_id => params[:room_id])
             .first
      b.approval = true
      b.save
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

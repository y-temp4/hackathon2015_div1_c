class RoomsController < ApplicationController
    before_action :authenticate_user!
  def index
    @rooms = Room.order("id DESC").where.not(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(@room.user_id) if @room.user_id
  end

  def new
    @room = Room.new
    if current_user
      @room.user_id = current_user.id
    else
      flash.notice = "ログインしているユーザーがいません"
      render "new"
    end
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      session[:room] = @room.id
      redirect_to @room, notice: "予約が完了しました。"
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

  def checked
    @checked_rooms=[]
    @bookings = Booking.where(:user_id => current_user, :approval => true)
    @bookings.each do |booking|
      @checked_rooms << Room.find(booking.room_id)
    end
  end

  def pending
    @pending_rooms=[]
    @bookings = Booking.where(:user_id => current_user, :approval => nil)
    @bookings.each do |booking|
      @pending_rooms << Room.find(booking.room_id)
    end
  end

  private
  def room_params
    params.require(:room).permit( :amount, :price ,:message , :address, :title, :image, :user_id, :date)
  end
end

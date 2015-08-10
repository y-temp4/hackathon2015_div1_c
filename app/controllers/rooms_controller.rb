class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(@room.user_id)
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
    Booking.where(:user_id => current_user, :approval => true).each do |booking|
      @checked_rooms << Room.find(booking.room_id)
    end
    #@checked_rooms = Room.includes(:bookings).where( booking: { user_id: current_user.id, approval: true } )
    # @checked_rooms = Booking.where(user_id: current_user.id, approval: true)
    # @checked_rooms = Booking.all
  end

  def pending
    @pending_rooms=[]
    Booking.where(:user_id => current_user, :approval => false).each do |booking|
      @pending_rooms << Room.find(booking.room_id)
    end
  end

  private
  def room_params
    params.require(:room).permit( :amount, :price ,:message , :address, :user_id, :title)
  end

end

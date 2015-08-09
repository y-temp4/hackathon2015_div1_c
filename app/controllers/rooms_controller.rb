class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
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
  private
  def room_params
    params.require(:room).permit( :amount, :price ,:message , :address)
  end

end

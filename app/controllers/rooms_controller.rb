class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show

  end

  def new
    @room = Room.new    
    @room.user_id = current_user.id
  end

  def create
    @room = Room.new(params[:room])
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
end

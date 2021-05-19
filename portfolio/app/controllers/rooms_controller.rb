class RoomsController < ApplicationController
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    #自分のエントリーを取得
    user_entries = current_user.entries
    #エントリーから所持するroom_idを取得
    user_rid = user_entries.map do |entry|
      entry.room_id
    end
    #room_idから所属するRoom情報を取得
    current_user_rooms =  user_rid.map do |id|
      Room.where(id: id)
    end

    #Room情報から共通するRoom_idを持つユーザー情報の取得
    users_array = current_user_rooms.map do |room|
      users = Entry.where(room_id: room.ids).where.not(user_id: current_user.id)
      users.map do |user|
        User.find_by(id: user.user_id)
      end
    end
    #配列が二重になったので苦肉の策
    @users = users_array.flatten
  
    #自分のEntry情報を取得
    @currentUserEntry=Entry.where(user_id: current_user.id)

  end
end
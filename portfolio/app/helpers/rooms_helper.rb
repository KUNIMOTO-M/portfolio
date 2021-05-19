module RoomsHelper

  def room
    if @user.id == current_user.id
    else
        @currentUserEntry.each do |cu|
            @userEntry.each do |u|
                if cu.room_id == u.room_id then
                    @isRoom = true
                    @roomId = cu.room_id
                end
            end
        end
        if @isRoom
        else
            @room = Room.new
            @entry = Entry.new
        end
    end
  end

  def profile_show
    @user = User.find_by(id: params[:id])
    #プロフィール画面で掲示板投稿を表示
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    room
  end
end

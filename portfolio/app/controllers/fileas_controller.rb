class FileasController < ApplicationController

  def new
    @file = Filea.new
  end

  def create
    @file = current_user.fileas.build(filea_params)
    if @file.save
      flash[:success] = "投稿しました"
			redirect_to "/users/#{current_user.id}/show3"
    else
      flash[:danger] = "投稿できませんでした"
			redirect_to "/users/#{current_user.id}/show3"
    end
  end

  def destroy
    @file = current_user.fileas.find_by(id: params[:id])
		@Filea.destroy
		flash[:success] = "投稿を削除しました"
		redirect_to "/users/#{current_user.id}/show3"
  end
  
  private

  def filea_params
    params.require(:filea).permit(:title, :content, :file)
  end
end

class FileasController < ApplicationController

  def new
    @file = Filea.new
  end

  def create
    @file = current_user.fileas.build(filea_params)
    if @file.save
      flash[:success] = "投稿しました"
			redirect_to notices_url
    else
      flash[:danger] = "投稿できませんでした"
			redirect_to notices_url
    end
  end

  def destroy
    @file = current_user.fileas.find_by(id: params[:id])
		@Filea.destroy
		flash[:success] = "投稿を削除しました"
		redirect_to notices_url
  end

  def filea_params
    params.require(:filea).permit(:title, :content, :file)
  end
end

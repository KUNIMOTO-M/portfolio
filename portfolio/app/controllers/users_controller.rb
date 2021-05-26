class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    profile_show
    @notices = @user.notices
  end

  def show2
    profile_show
    @microposts = @user.microposts
  end

  def show3
    profile_show
    @files = @user.fileas
  end


  def index
    @indeies = User.all
  end
  

  def edit
    @user = User.find_by(id: current_user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました"
      redirect_to @user
    else
      render 'edit'
    end
    
  end

  def destroy
  end

  def set
    @user = User.find_by(id: current_user)
  end
  
  def search
    if params[:area]
      @users = User.where(area: params[:area])
    elsif params[:search]
      if !params[:search].blank?
        @users = User.where("name LIKE ? OR introduction LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      end
    else
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  

  def message
    @message = current_user.entries
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :file, :area, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
end

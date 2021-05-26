class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @microposts = Micropost.paginate(page: params[:page])
      @micropost  = Micropost.new 
    end
  end

  def about
  end

  def help
  end
end

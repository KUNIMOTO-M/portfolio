class StaticPagesController < ApplicationController
  def home
    if login?
    @microposts = Micropost.all 
    @micropost  = Micropost.new 
    end
  end

  def about
  end

  def help
  end
end

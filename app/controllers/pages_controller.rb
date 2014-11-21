class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]

  def home
  end
  
  def inside
    @website_aantal=current_user.websites.size
    @website=current_user.websites.last
    @websites_pop=current_user.websites.last(3)
  end 
    
end

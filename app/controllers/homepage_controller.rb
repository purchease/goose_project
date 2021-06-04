class HomepageController < ApplicationController

  def index
    @user = User.first
    # Create a games or Join a games with a code
  end



end
class HomepageController < ApplicationController

  def index
    @user = User.first
    # Create a game or Join a game with a code
  end



end
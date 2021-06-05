class HomepageController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!


  def index
    # @user = User.first
    # Create a games or Join a games with a code

    redirect_to @user.current_game if user_signed_in? && @user.present? && @user.players.present? && @user.current_game.status != Game::FINISHED
  end


  private

  def set_user
    # params[:uuid] = '072e69bc-c51a-11eb-8529-0242ac130003' if Rails.env.development?
    puts "received uuid : #{params[:uuid]}"
    uuid = params[:uuid].split('!').first
    puts "modified uuid : #{uuid}"
    @user = User.where(fidmarques_uuid: uuid).first
    sign_in @user, event: :authentication if !user_signed_in? || @user.present?
  end
end
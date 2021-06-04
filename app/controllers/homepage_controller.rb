class HomepageController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!


  def index
    # @user = User.first
    # Create a games or Join a games with a code

  end


  private

  def set_user
    params[:uuid] = '219053ce-c51a-11eb-8529-0242ac130003'

    @user = User.where(fidmarques_uuid: params[:uuid]).first
    sign_in @user

  end
end
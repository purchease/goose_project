class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive_events

    if params[:event] == "OPTIN"
      # Event 1 - OptIn
      # Retourner l'URL si success sinon ?
      user = User.where(
        fidmarques_uuid: params[:user_id],
        email: params[:user][:email],
        name: params[:user][:first_name]
      ).first_or_create do |user|
        user.password = SecureRandom.hex(10)
      end

      if user.present?
        render json: { message: "https://goose-fidmarques.herokuapp.com/?uuid=#{user.fidmarques_uuid}"}, status: 200
      else
        render json: { message: "User not found or created"}, status: 403
      end

      post_to_core(params[:user_id])

    elsif params[:event] == "EARN"
      # Retourner l'URL si success
      if params[:points_earned].positive?
        @user = User.where(fidmarques_uuid: fidmarques_uuid).first
        if @user.try(:players).try(:last).try(:game).try(:status) != "FINISHED" && @user.players.exists?
          create_credit = Game::CreateCreditActiveGame.run!(user: @user)
        else
          create_credit = Game::CreateCreditInactiveGame.run!(user: @user)
        end

        if create_credit.success?
          render json: { message: "https://goose-fidmarques.herokuapp.com/?uuid=#{user.fidmarques_uuid}"}, status: 200
        else
          render json: { message: "Credit could not be credited", status: 403 }
        end
      else

      end
    else
      # Rien à faire donc je te dis NOP
    end
  end

  def post_to_core(user_id)
    url = 'https://staging-api.purchease.com/api/integration/v1/plugins/push_message'

    RestClient.post url, (payload(user_id) do |response, _request, _result|
      case response.code
      when 200
        response.return!
      else
        render json: { message: "Warning nous avons une 404"}, status: 404
      end
    end)
  end

  def payload(user_id)
    {
      token: "thisisanothersecret",
      user_id: user_id,
      payload: {
        message: "Come ooooooooooon"
      }
    }
  end

end

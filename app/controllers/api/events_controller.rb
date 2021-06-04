class EventsController < ApplicationController
  before_action :authenticate_user!

  def receive_events
    params =
      {
        user_id: "219053ce-c51a-11eb-8529-0242ac130003",
        event: event,
        points_earned: 0,
        user: {
          first_name:user.firstname,
          email: user.email
        }
      }
    if params[:event]
      # Event 1 - OptIn
      # Retourner l'URL si success sinon ?
    elsif params[:event]
      # Event 2 - Création d'un crédit pour la partie
      # Retourner l'URL si success
    else
      # Rien à faire donc je te dis NOP
    end
  end
end

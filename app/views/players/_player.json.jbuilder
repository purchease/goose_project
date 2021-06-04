json.extract! player, :id, :color, :user_id, :game_id, :created_at, :updated_at
json.url player_url(player, format: :json)

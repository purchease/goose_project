class CreateGameInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :game_invitations do |t|
      t.references :game, null: false, foreign_key: true
      t.string :invitation_token
      t.string :email
      t.datetime :is_used_at

      t.timestamps
    end
  end
end

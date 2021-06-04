class AddInvitationCodeToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :invitation_code, :string
  end
end

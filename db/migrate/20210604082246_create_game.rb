class CreateGame < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :number_of_players
      t.timestamps

    end
  end
end

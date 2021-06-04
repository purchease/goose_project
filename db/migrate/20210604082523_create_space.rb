class CreateSpace < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.references :game_space_skill, null: false, foreign_key: true
    end
  end
end

class CreateSpace < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.references :space_skill, null: false, foreign_key: true
      t.integer :position
      t.references :game, null: false, foreign_key: true
      t.timestamps

    end
  end
end

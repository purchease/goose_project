class CreateSpaceSkill < ActiveRecord::Migration[6.0]
  def change
    create_table :space_skills do |t|
      t.string :name
      t.text :rule
      t.timestamps

    end
  end
end

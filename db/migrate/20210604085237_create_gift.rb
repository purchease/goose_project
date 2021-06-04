class CreateGift < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name
    end
  end
end

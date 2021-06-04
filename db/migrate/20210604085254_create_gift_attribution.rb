class CreateGiftAttribution < ActiveRecord::Migration[6.0]
  def change
    create_table :gift_attributions do |t|
      t.references :player, null: false, foreign_key: true
    end
  end
end

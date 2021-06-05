class AddAmountToGameCredit < ActiveRecord::Migration[6.0]
  def change
    add_column :game_credits, :amount, :integer, default: 0
  end
end

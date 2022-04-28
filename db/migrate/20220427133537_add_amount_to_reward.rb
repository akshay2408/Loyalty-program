class AddAmountToReward < ActiveRecord::Migration[5.2]
  def change
    add_column :rewards, :amount, :integer
  end
end

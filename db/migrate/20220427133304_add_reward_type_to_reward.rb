class AddRewardTypeToReward < ActiveRecord::Migration[5.2]
  def change
    add_column :rewards, :reward_type, :text
  end
end

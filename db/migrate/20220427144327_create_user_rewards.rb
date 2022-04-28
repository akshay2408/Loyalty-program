class CreateUserRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rewards do |t|
      t.string :user_id
      t.string :reward_id
      t.string :reward_name

      t.timestamps
    end
  end
end

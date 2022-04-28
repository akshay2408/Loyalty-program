class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :reward_name
      t.string :reward_scope

      t.timestamps
    end
  end
end

class Point < ApplicationRecord
  belongs_to :user
  after_create :check_for_month_score

  def check_for_month_score
    if score >= 100
      reward = Reward.find_by_scope("more then 100 points")
      UserReward.create!(user_id: user.id, reward_id: reward.id)
    end
  end
end

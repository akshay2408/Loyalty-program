class RewardJob < ApplicationJob
  queue_as :default

  def birth_date(user_id)
    user = User.find user_id
    if user.birth_date >= Date.today
      reward = Reward.find_by_scope("on birthday month")
      user.user_rewards.create!(reward: reward)
    end
  end
  
  def expire_points
    Point.destroy_all
  end
end  
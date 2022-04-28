class AssignTierJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find user_id

    if user.points.sum(:score) >= 5000 
      loyalty = Loyalty.find_by_scope("5000 points")
    elsif user.points.sum(:score) >= 1000
      loyalty = Loyalty.find_by_scope("1000 points")
      reward  = Reward.find_by_scope("Airport Lounge Access Reward") 
      4.times { user.user_rewards.create!(reward: reward) }
    end

    user.user_loyalties.create!(loyalty: loyalty)
  end
end

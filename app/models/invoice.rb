class Invoice < ApplicationRecord
  belongs_to :user

  after_create :create_point, :spend_more_then_1000 
  after_create :assign_tier
  
  def create_point
    cal_score = foreign ? (amount / 5.0) : (amount / 10.0)
    
    user.points.create!(score: cal_score)
  end

  def spend_more_then_1000
    if amount >= 1000
      reward = Reward.find_by_scope("spending more then 1000")
      user.user_rewards.create!(reward: reward)
    end   
  end 
  
  def assign_tier
    AssignTierJob.perform_later user_id
  end
end

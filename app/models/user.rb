class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable        
  has_many :invoices, :dependent => :destroy
  has_many :points, :dependent => :destroy
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  has_many :user_loyalties
  has_many :loyalties, through: :user_loyalties

  after_create :standard_tier_customer

  def standard_tier_customer
    loyalty = Loyalty.find_by_scope("0 points")
    self.user_loyalties.create!(loyalty: loyalty)
  end
end

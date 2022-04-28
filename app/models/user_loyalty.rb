class UserLoyalty < ApplicationRecord
  belongs_to :loyalty
  belongs_to :user
end

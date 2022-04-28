class AdminUser < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable
end

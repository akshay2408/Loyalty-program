class HomeController < ApplicationController
  #skip_before_action :authenticate_user!
  def index

  end

  def rewards
    @rewards = current_user.rewards
  end
end
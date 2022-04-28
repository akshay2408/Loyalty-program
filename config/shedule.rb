every 1.day, :at => '4:30 am' do 
  rake "Reward:birth_date"
end

every 1.year, :at => 'December 31th 11:59pm' do
  rake "Reward:expire_points"
end

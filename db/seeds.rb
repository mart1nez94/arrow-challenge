# User for ID 1
User.create!(id: 1, email: "armandoomtzz@gmail.com", password: "armando")

# User for ID 2
User.create!(id: 2, email: "armandog@icalialabs.com", password: "armando")

# Arrows for ID 1
5.times do |time|
  comment = "This is the #{time} arrow created using a seed"
  user_id = 1
  to_user_id = 2
  Arrow.create!(comment: comment, user_id: user_id, to_user_id: to_user_id)
end

# Arrows for ID 2
10.times do |time|
  comment = "This is the #{time} arrow created using a seed"
  user_id = 2
  to_user_id = 1
  Arrow.create!(comment: comment, user_id: user_id, to_user_id: to_user_id)
end

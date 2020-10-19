json.users @users.each do |user|
  json.user_id user.id
  json.email user.email
  json.password user.password
end

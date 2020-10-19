json.user_id @user.id
json.email @user.email
json.password @user.password

json.user_posts @posts.each do |post|
  json.post_id post.id
  json.title post.title
  json.text post.body
end

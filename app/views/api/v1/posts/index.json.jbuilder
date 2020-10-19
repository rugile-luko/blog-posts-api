json.posts @posts.each do |post|
  json.post_id post.id
  json.author post.user.email
  json.title post.title
  json.text post.body
end
json.id @post.id
json.author @post.user.email
json.title @post.title
json.text @post.body

json.comments @comments.each do |comment|
  json.comment_author comment.user
  json.comment_text comment.text
end
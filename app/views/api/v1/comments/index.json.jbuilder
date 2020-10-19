json.posts @comments.each do |comment|
  json.id comment.id
  json.post_id comment.post_id
  json.text comment.text
end
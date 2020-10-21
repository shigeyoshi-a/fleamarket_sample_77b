json.user_id   @comment.user.id
json.user_nickname  @comment.user.nickname
json.comment   @comment.comment
json.created_at @comment.created_at.strftime("%Y-%m-%d %H:%M")
json.item_id @comment.item.id
json.id @comment.id

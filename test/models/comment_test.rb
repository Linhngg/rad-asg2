require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "valid comment" do
    @comment = Comment.new(content: "A comment of the post", user_id: 1, new_id: 1)
    assert @comment.valid?
  end
  
  test "user not exist comment" do
    @comment = Comment.new(content: "A comment of the post", user_id: 100, new_id: 1)
    assert !@comment.valid?
  end
  
  test "news not exist comment" do
    @comment = Comment.new(content: "A comment of the post", user_id: 1, new_id: 100)
    assert !@comment.valid?
  end
  
  test "invalid content comment" do
    @comment = Comment.new(content: " ", user_id: 1, new_id: 1)
    assert !@comment.valid?
  end
end

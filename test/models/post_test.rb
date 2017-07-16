require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "posts can be created" do
    assert_instance_of(Post, Post.create(title: 'Really cool title',
                                         text: 'a big long string of text'))
  end

  test "posts with markdown in text can be turned into html" do
    post = Post.create(title: 'testing markdown',
                       text: '```CONSTANT = 1```')
    assert_includes(markdown.render(post.text), "<code>")
    assert_includes(markdown.render(post.text), "</code>")
  end

end

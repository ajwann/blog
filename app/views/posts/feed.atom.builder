atom_feed({'xmlns:app' => 'http://www.w3.org/2007/app',
           'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed|
  feed.title("A Gem of a Blog")
  feed.updated((@posts.first.created_at))
  feed.tag!('openSearch:totalResults', 10)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(markdown.render(post.title))
      entry.content(markdown.render(post.text), type: 'html')
      entry.tag!('app:edited', Time.now)

      entry.author do |author|
        author.name("Adam Wanninger")
      end
    end
  end
end

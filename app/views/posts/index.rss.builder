#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "A Gem of a Blog"
    xml.author "Adam Wanninger"
    xml.description "Blog about Ruby, Rails, and more!"
    xml.link root_url
    xml.language "en"

    @posts.each do |post|
      xml.item do

        if post.title
          xml.title post.title
        else
          xml.title "Untitled"
        end

        xml.author "Adam Wanninger"
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post.id
        text = post.text
        xml.description "<p>" + text + "</p>"
      end
    end
  end
end

#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blogger"
    xml.language "en"

    for article in @articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "http://localhost:3000/articles" + article.id.to_s
        xml.guid article.id

        text = article.body
    # if you like, do something with your content text here e.g. insert image tags.
    # Optional. I'm doing this on my website.
        if article.image.exists?
            image_url = article.image.url(:large)
            image_align = ""
            image_tag = "
                <p><img src='" + image_url +  "' align='" + image_align  + "' /></p>
              "
            text = text.sub('{image}', image_tag)
        end
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end
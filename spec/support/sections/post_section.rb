class PostsSection::PostSection < SitePrism::Section
  element :title, "a.post-title"
  element :content, "div.post-content"
  element :read_more, "a.read-more"
end

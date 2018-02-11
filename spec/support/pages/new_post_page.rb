class NewPost < SitePrism::Page
  set_url "/posts/new"

  element :title,  "input#post_title"
  element :content, "textarea#post_content"
  element :post_button, "input.btn-post"

  def create_post
    fill_in "Title", with: 'xxx'
    fill_in "Content", with: 'yyy'
    post_button.click
  end
end

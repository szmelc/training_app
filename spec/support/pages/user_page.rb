class UserPage < SitePrism::Page
  set_url '/users/{id}'
  element :edit_btn, "input.btn-edit"

  def go_to_edit_profile
    edit_btn.click
  end
end

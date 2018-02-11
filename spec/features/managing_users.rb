require "rails_helper"

describe "managing users", type: :feature do
  include_context "users"
  let(:userpage) { UserPage.new }

  context "when user is not admin" do
    before do
      log_in_as user
    end

    scenario "can access but not edit other users accounts" do
      userpage.load(id: 1)
      expect(userpage).not_to have_edit_btn
    end

    scenario "can access and edit own account" do
      userpage.load(id: user.id)
      expect(userpage).to have_edit_btn
      userpage.go_to_edit_profile
      fill_in "Name", with: "Jan"
      click_button "Submit"
      expect(page).to have_content("Jan")
    end
  end

  context "when user is admin" do
    before do
      log_in_as admin
      userpage.load(id: 1)
    end

    scenario "user can access and edit all users accounts" do
      expect(userpage).to have_edit_btn
      userpage.go_to_edit_profile
      fill_in "Name", with: "Jan"
      click_button "Submit"
      expect(page).to have_content("Jan")
    end
  end
end

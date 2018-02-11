require "rails_helper"

describe "managing posts", type: :feature do
  include_context "users"
  let(:newpostpage) { NewPost.new }
  let(:postpage) { PostPage.new }

  context "when user is not admin" do
    before do
      log_in_as user
    end

    scenario "user can create a post" do
      newpostpage.load
      newpostpage.create_post
      expect(page).to have_content("Post successfully created")
      expect(user.posts.count).to eq(1)
    end

    context "user is posts's author" do
      before do
        newpostpage.load
        newpostpage.create_post
      end

      scenario "can edit the post" do
        expect(page).to have_content("Edit Post")
        click_link "Edit Post"
        fill_in "Title", with: "abc123"
        fill_in "Content", with: "abc123"
        click_button "Post"
        expect(page).to have_content("abc123")
      end

      scenario "can delete the post" do
        expect(page).to have_content("Destroy")
      end
    end

    context "user is not posts's author" do
      let!(:post) { create(:post, user: user1, created_at: Time.now) }
      before do
        postpage.load(id: 1, post_id: 1)
      end

      scenario "cannot edit the post" do
        expect(page).not_to have_content("Edit Post")
      end

      scenario "cannot delete the post" do
        expect(page).not_to have_content("Destroy")
      end
    end
  end

  context "when user is admin" do
    before do
      log_in_as admin
      postpage.load(id: 1, post_id: 1)
    end

    scenario "user can delete all posts" do
      expect(page).to have_content("Destroy")
    end

    scenario "user can edit all posts" do
      expect(page).to have_content("Edit Post")
    end
  end
end

require "rails_helper"

describe "accessing admin panel", type: :feature do
  include_context 'users'
  let(:adminpage) { AdminPage.new }

  context "when user is not admin" do
    before do
      log_in_as user
    end

    scenario "cannot access admin panel" do
      adminpage.load
      expect(page.current_path).to eq("/")
    end
  end

  context "when user is admin" do
    before do
      log_in_as admin
    end

    scenario "can access admin panel" do
      adminpage.load
      expect(page.current_path).to eq("/admin")
    end
  end


end

require 'rails_helper'

describe 'listing posts on home page', type: :feature do
  let(:homepage) { Home.new }

  context "user goes to homepage" do
    it 'checks for proper layout' do
      homepage.load
      expect(homepage).to have_men
      expect(homepage).to have_posts
    end
  end


end

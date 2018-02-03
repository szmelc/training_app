require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { create(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

    it do
      should validate_inclusion_of(:title).
        in_array(User::TITLES)
    end

    it do
      should validate_inclusion_of(:country).
        in_array(CountrySelectInput::LIST )
    end

    it 'user is not an admin by defualt' do
      expect(user.admin).to be(false)
    end
end

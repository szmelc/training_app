RSpec.shared_context 'users' do
  let(:admin) { FactoryBot.create(:user, :admin, confirmed_at: Time.now) }
  let(:user)  { FactoryBot.create(:user, confirmed_at: Time.now) }
  let(:user1)  { FactoryBot.create(:user, confirmed_at: Time.now) }
end

RSpec.configure do |rspec|
  rspec.include_context "users", include_shared: true
end

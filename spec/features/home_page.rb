describe 'listing posts on home page', type: :feature do
  let(:homepage) { HomePage.new }

  it 'checks' do
    expect(homepage).to have_menu_section
  end
end

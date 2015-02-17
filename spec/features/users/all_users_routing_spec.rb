include Warden::Test::Helpers
Warden.test_mode!

feature 'All users pages', :devise do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Users can see all users
  #   Given I am signed in
  #   When I visit the '/all_users' page
  #   Then I see list of all currently existing users
  scenario 'user sees own profile' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit 'all_users'
    expect(page).to have_content 'Users'
    expect(page).to have_content user.name
    expect(page).to have_content user.email
  end
end
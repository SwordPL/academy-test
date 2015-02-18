include Warden::Test::Helpers
Warden.test_mode!

# Feature: City index page
#   As a user
#   I want to see a list of cities
#   So I can see what city application is concerned about
feature 'City index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: City listed on city details page
  #   Given I am signed in
  #   When I visit the city detailed page
  #   Then I see city name and short-name
  scenario 'user sees city details' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit city_path(city)
    expect(page).to have_content 'City'
    expect(page).to have_content city.name
    expect(page).to have_content city.short_name
  end

end

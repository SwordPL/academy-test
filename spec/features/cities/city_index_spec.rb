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

  # Scenario: City listed on cities index page
  #   Given I am signed in
  #   When I visit the city index page
  #   Then I see a city
  scenario 'user sees cities' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).to have_content 'Cities'
    expect(page).to have_content city.name
    expect(page).to have_content city.short_name
  end

  # Scenario: Adding new city
  #   Given I am signed in
  #   When I visit the city index page
  #   Then I want to go to 'add city' page
  scenario 'user wish to add new city' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).to have_content 'Cities'
    click_on('New City')
    expect(find('h3')).to have_content 'Add new city'
    expect(page).to have_button 'Create!'
  end

  # Scenario: Editing existing city
  #   Given I am signed in
  #   When I visit the city index page
  #   Then I want to edit existing city
  scenario 'user wish to edit city' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).to have_content 'Cities'
    find_by_id(city.short_name).click_on('Edit City')
    expect(page).to have_content 'Edit City'
    expect(page).to have_content 'Edit'
  end

  # Scenario: Deleting existing city
  #   Given I am signed in
  #   When I visit the city index page
  #   Then I want to delete existing city
  scenario 'user wish to edit city' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).to have_content 'Cities'
    find_by_id(city.short_name).click_on('Delete City')
    expect(page).to have_content 'Cities'
    expect(page).not_to have_content city.name
  end

end

include Warden::Test::Helpers
Warden.test_mode!

# Feature: City edit page
#   As a user
#   I want to see a details of city
#   So I can edit every detail
feature 'City edit page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Editing the city
  #   Given I am signed in and have chosen city to edit
  #   When I visit the city edit page
  #   Then I can edit and see results saved results
  scenario 'user sees city details' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit edit_city_path(city)
    fill_in 'Name', with: 'City of Madabara'
    fill_in 'Short name', with: 'MAD'
    click_on 'Create!'
    expect(page).to have_content 'Name: City of Madabara'
    expect(page).to have_content 'Short name: MAD'
    visit current_path
    expect(page).to have_content 'Name: City of Madabara'
    expect(page).to have_content 'Short name: MAD'
  end

end

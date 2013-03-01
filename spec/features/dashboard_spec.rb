require 'spec_helper'

feature 'Dashboard' do
  test_helpers

  scenario 'visiting the dashboard' do
    capybara_sign_in user_1
    visit '/flms'
    expect(page).to have_content('Statistics')
  end
end

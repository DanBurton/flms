require 'spec_helper'

feature 'Pages > Create' do
  test_helpers

  scenario 'allows to create a new page' do
    capybara_sign_in user_1
    visit '/flms/pages/new'
    fill_in 'Title', with: 'my new title'
    fill_in 'Url', with: 'my new url'
    click_button 'Create Page'
    Flms::Page.should have(1).instances
    page = Flms::Page.first
    expect(page.title).to eql 'my new title'
    expect(page.url).to eql 'my new url'
  end
end


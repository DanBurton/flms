require 'spec_helper'

feature 'TextLayers > Edit', js: true do
  include NamedFactories

  scenario 'editing an existing text layer' do
    text_layer_1a1

    capybara_sign_in user_1
    visit "/flms/pages/#{page_1.url}/blocks/#{block_1a.id}"

    # click on the 'edit' button.
    click_link "edit-layer-#{text_layer_1a1.id}"

    fill_in 'Name', with: 'new-layer-name'
    fill_in 'Text', with: 'layer text content'
    fill_in 'Font size', with: '0.5'
    fill_in 'Color', with: 'fff'

    click_button 'Update Text layer'

    # Expect to be back at the block page.
    expect(current_path).to eql "/flms/pages/#{page_1.url}/blocks/#{block_1a.id}"

    # Check database updates.
    expect(Flms::Layer).to have(1).instances
    expect(Flms::Layer.first.name).to eql 'new-layer-name'
  end
end

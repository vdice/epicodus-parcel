require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the parcel path', {:type => :feature}) do
  it('integrates logic with sinatra and front-end successfully') do
    visit('/')
    fill_in('Width', :with => 1)
    fill_in('Height', :with => 1)
    fill_in('Depth', :with => 1)
    fill_in('Weight', :with => 5)
    fill_in('Service', :with => 'Expedited')
    fill_in('Distance', :with => 3000)
    click_button('Submit')
    expect(page).to have_content('The cost to ship your package is: $37.50')
  end
end

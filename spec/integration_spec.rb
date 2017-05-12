require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('brand', {:type => :feature}) do
  it('gets to index properly') do
    visit('/')
    expect(page).to have_content('Welcome')
  end
  it('process brand name page properly') do
    visit('/brands/new')
    fill_in("name", :with => 'nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end
end

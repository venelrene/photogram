require 'rails_helper.rb'
# visit the root route
# click on a button to create a new post
# fill out the bits of the form that we need.
# click the submit button
# expect the page that we’re sent to to have specific text
# expect the page to contain our photo.

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/dragon.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
end
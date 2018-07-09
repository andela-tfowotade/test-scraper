require "rails_helper"

describe "Listing movies", type: :feature do
  it "redirect to the index page" do
    visit "/"
    expect(page).to have_content("We are Live!!!")
  end
end

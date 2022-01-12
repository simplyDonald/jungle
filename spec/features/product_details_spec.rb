require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )

    end
  end
  
  scenario "They see the selected product" do
    # ACT
    visit root_path

    # page.find('Details').click
    first(:link, 'Details').trigger('click')
    
    
    expect(page).to have_css 'section.products-show'
    
    # DEBUG / VERIFY
    save_screenshot
    puts page.html
    
  end
end

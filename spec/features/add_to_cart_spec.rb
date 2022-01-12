require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "The product is added to the cart" do
    # ACT
    visit root_path

    # page.find('Details').click
    # click_on(class: 'filter-case-studies')
    within('.products') do
      first(:button, 'Add').trigger('click')
    end
    sleep 2
    
    
    
    within('#navbar') do       
      expect(page).to have_content("My Cart (1)")     
    end
    
    # DEBUG / VERIFY
    save_screenshot 'add_to_cart.png'
    
  end
end

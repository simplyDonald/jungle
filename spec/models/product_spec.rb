require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should be valid with valid attributes' do
      @category = Category.create(name: 'Electronics')
      @product = Product.create(name: 'book',price: 230,quantity: 30,category: @category)
      expect(@product).to be_valid 
    end

    it "should not be valid without name" do
      @category = Category.create(name: 'Electronics')
      @product = Product.create(name: '',price: 230,quantity: 30,category: @category)
      expect(@product).to_not be_valid 
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "should not be valid without price" do
      @category = Category.create(name: 'Electronics')
      @product = Product.create(name: 'book',price: nil,quantity: 30,category: @category)
      expect(@product).to_not be_valid 
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it "should not be valid without quantity" do
      @category = Category.create(name: 'Electronics')
      @product = Product.create(name: 'book',price: 3000,quantity: nil,category: @category)
      expect(@product).to_not be_valid 
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it "should not be valid without quantity" do
      @category = Category.create(name: 'Electronics')
      @product = Product.create(name: 'book',price: 3000,quantity: 3,category: nil)
      expect(@product).to_not be_valid 
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end

    
  end
end

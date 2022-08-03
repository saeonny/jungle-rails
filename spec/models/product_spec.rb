require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do

    it 'should be able to create/save new product with name,quantity,price_cents,category' do
      new_category = Category.new
      new_product = Product.new({
        name: 'newnew  plant', 
        description: 'plant plant plantt',
        image: "image_url",
        quantity: 2,
        price_cents: 40.22,
        category: new_category
      })
      expect(new_product).to be_valid
    end

    it 'without name, should not able to save new product' do
      new_category = Category.new
      new_product = Product.new({
        name: nil, 
        description: "plant plant plant",
        image: "image_url",
        quantity: 2,
        price_cents: 40.22,
        category: new_category
      })
      expect(new_product).not_to be_valid
    end

    it 'without price_cents, should not able to save new product' do
      new_category = Category.new
      new_product = Product.new({
        name: "new product", 
        description: "plant plant plant",
        image: "image_url",
        quantity: 2,
        price_cents: nil,
        category: new_category
      })
      expect(new_product).not_to be_valid
    end

    it 'without quantity, should not able to save new product' do
      new_category = Category.new
      new_product = Product.new({
        name: "new product", 
        description: "plant plant plant",
        image: "image_url",
        quantity: nil,
        price_cents: 40.22,
        category: new_category
      })
      expect(new_product).not_to be_valid
    end

    it 'without category, should not able to save new product' do
      
      new_product = Product.new({
        name: "new product", 
        description: "plant plant plant",
        image: "image_url",
        quantity: 2,
        price_cents: 40.22,
        category: nil
      })
      expect(new_product).not_to be_valid
    end


  end
end
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves a valid product" do
      technology = Category.find_or_create_by! name: "Technology" 
      product = described_class.new(name: "Fern", price: 100, category: technology, quantity: 2)
      expect(product).to be_valid
    end

    it "does not save a valid product without name" do
      no_Name = Category.find_or_create_by! name: "No_Name" 
      product = described_class.create(name: nil, price: 100, category: no_Name, quantity: 2)
      # puts product.errors.full_messages
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it "does not save a valid product without a valid price" do
      no_Price = Category.find_or_create_by! name: "No_Price" 
      product = described_class.create(name: "Potato", category: no_Price, quantity: 2)
      # puts product.errors.full_messages
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Price can't be blank"
    end

    it "does not save a valid product without a valid category" do
      no_Category = Category.find_or_create_by! name: "No_category" 
      product = described_class.create(name: "Potato", price: 100, category: nil, quantity: 2)
      # puts product.errors.full_messages
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
    
    it "does not save a valid product without a valid quantity" do
      no_Quantity = Category.find_or_create_by! name: "No_Quantity" 
      product = described_class.create(name: "Potato", price: 100, category: no_Quantity)
      # puts product.errors.full_messages
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end
  end
end
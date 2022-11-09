require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "should validate if the name exists" do
      @category = Category.new
      @product = Product.new
      @product.name = ""
      @product.save
      expect(@product.errors.full_messages.include?("Name can't be blank")).to eql(true)  
    end

    it "should validate if the price exists" do
      @category = Category.new
      @product = Product.new
      @product.price = 
      @product.save
      expect(@product.errors.full_messages.include?("Price can't be blank")).to eql(true)
    end

    it "should validate if the quantity exists" do
      @category = Category.new
      @product = Product.new
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages.include?("Quantity can't be blank")).to eql(true)
    end

    it "should validate if the category exists" do
      @category = Category.new
      @product = Product.new
      @product.save
      expect(@product.errors.full_messages.include?("Category can't be blank")).to eql(true)
    end

    
  end
end
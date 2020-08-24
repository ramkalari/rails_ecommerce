require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "price must be positive" do
    product = Product.new(title: "Introduction to Rails", description: "rails",
                          image_url: "zzz.jpg")
    product.price = -2
    assert product.invalid?
    assert product.errors[:price].any?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

   test "product title must be unique 1" do
    product = Product.new(title: "Introduction to Ruby 1", description: "rails",
                          image_url: "zzz.jpg", price: 1)
    product.save
    assert product.valid?
  end

  test "product title must be unique 2" do
    product = Product.new(title: "Introduction to Ruby 1", description: "rails",
                          image_url: "zzz.jpg", price: 1)
    product.save
    assert product.valid?
  end

  test "product title must be unique" do
    product = Product.new(title: "Introduction to Ruby", description: "rails",
                          image_url: "zzz.jpg", price: 1)
    assert product.invalid?
    assert product.errors[:title].any?
    assert_equal ["has already been taken"],  product.errors[:title]
  end

  test "product title must be atleast 10 characters long" do
    product = Product.new(title: "Ruby", description: "rails",
                          image_url: "zzz.jpg", price: 1)
    assert product.invalid?
    assert product.errors[:title].any?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]
  end

  test "empty test" do
  end


end

class Admin::DashboardController < ApplicationController
  def show
    @show_product_count = Product.count
    @show_category_count = Category.count
    puts "There are currently #{@show_category_count} categories and #{@show_product_count} products."
  end
end

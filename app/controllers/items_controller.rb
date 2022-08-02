class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  # @supermarket = Supermarket.find(params[:supermarket_id])
  # @items = Item.joins(:customers)
  #   .where("supermarket_id = ?", @supermarket.id).distinct
  #used a practice IC for reference. still figuring this trick out.
end

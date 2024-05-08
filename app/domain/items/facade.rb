# frozen_string_literal: true

module Items::Facade
  module_function

  def items_for_sale(user_id)
    seller = User.find_by(id: user_id)
    raise StandardError, 'seller not found' if seller.nil?

    seller.items.for_sale.ids
  end

  def sold_items(user_id)
    seller = User.find_by(id: user_id)
    raise StandardError, 'seller not found' if seller.nil?

    seller.items.not.for_sale.ids
  end

  def upload(user_id:, item_name:, item_price:, skip_nsfw_validation: false)
    nsfw_validator = Items::NsfwValidator.new(item_name)
    nsfw_validator.validate unless skip_nsfw_validation

    seller = User.find_by(id: user_id)
    raise StandardError, 'seller not found' if seller.nil?
    raise StandardError, 'seller not verified' unless seller.is_verified?

    Item.create!(user_id: user_id, name: item_name, price: item_price, is_nsfw: nsfw_validator.nsfw?)
  end

  def sell(item_id)
    item = Item.find_by(id: item_id)
    raise StandardError, 'item not found' if item.nil?
    raise StandardError, 'item already sold' if item.is_sold?

    item.update!(is_sold: true)
  end
end

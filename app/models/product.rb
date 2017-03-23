class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

    def self.serialize(product)
 
    # start with the open brace to create a valid JSON object
    serialized_product = '{'
 
    serialized_product += '"name": "' + product.name + '", '
    serialized_product += '"price": "' + product.price.to_s + '", '
    serialized_product += '"inventory": ' + product.inventory.to_s + ', '
    serialized_product += '"description": "' + product.description + '", '
 
    # the author association can also be represented in JSON
    serialized_product += '"orders": {'
    serialized_product += '"name": "' + product.orders.name + '"}'
 
    # and end with the close brace
    serialized_product += '}'
  end
end

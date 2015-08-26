class LineItem < ActiveRecord::Base
  attr_accessible :order, :product, :price

  belongs_to :order
  belongs_to :product
end

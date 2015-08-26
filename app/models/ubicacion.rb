class Ubicacion < ActiveRecord::Base

  has_many :products
  attr_accessible :slot ,:pasillo


 def to_s
  slot
 end

end

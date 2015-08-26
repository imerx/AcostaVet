class Proveedor < ActiveRecord::Base

	has_many :products
	
  attr_accessible :nombre ,:rfc, :direccion

def to_s
  nombre
 end
  	
  
end

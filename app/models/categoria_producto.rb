class CategoriaProducto < ActiveRecord::Base

has_many :products

  attr_accessible :descripcion, :nombre


  def to_s
  nombre
  end


end

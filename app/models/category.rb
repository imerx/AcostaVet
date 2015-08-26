class Category < ActiveRecord::Base
  attr_accessible :descripcion, :nombre
 
 has_many :animals
 has_many :vacunas
  #has_many :problems, :through => :symptoms 


  def to_s
  nombre
  end

end

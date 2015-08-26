class Vacuna < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :precio ,:periodo_vacunacion , :category_id,:servicio_id


belongs_to :category

has_many :animal_vacunas
has_many :animals, :through => :animal_vacunas

 belongs_to :servicio

validates_presence_of  :nombre, :periodo_vacunacion, :category_id, :message => " error!! Campo en blanco"  

  def to_s
  nombre
  end


 
end

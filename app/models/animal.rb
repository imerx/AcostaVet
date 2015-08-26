class Animal < ActiveRecord::Base
  attr_accessible :client_id, :color, :comentario,  :nacio_el, :nombre, :raza, :sexo, :category_id
  



belongs_to :client
belongs_to :category

has_many :animalhistories

has_many :animal_servicios
has_many :facturas, :through => :animal_servicios


has_many :animal_vacunas
has_many :facturas, :through => :animal_vacunas


validates_presence_of  :sexo,:nombre,:category,:nacio_el,:sexo,  :message => " error!! Campo en blanco"  

#ha\
  
  def to_s
  nombre
  end
 
 

end

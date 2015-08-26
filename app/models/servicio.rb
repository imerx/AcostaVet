class Servicio < ActiveRecord::Base
  attr_accessible :clave, :descripcion, :doctor_id, :nombre , :precio




has_many :facturas
has_many :servicios, :through => :facturas

 has_many :vacunas

 has_many :animal_vacunas
 has_many :animal_servicios

def to_s
 nombre
end


end

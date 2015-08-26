class AnimalVacuna < ActiveRecord::Base
  attr_accessible :animal_id, :category_id, :cita, :doctor_id, :vacuna_id,:servicio_id,:factura_attributes

 validates_presence_of  :doctor_id,:vacuna_id , :message => " error!! Campo requerido"  


 belongs_to :animal
 belongs_to :vacuna
 belongs_to :doctor
 belongs_to :servicio

has_many :factura, :dependent => :destroy
accepts_nested_attributes_for :factura, :allow_destroy => true
  
  
 scope :citas_proximas ,where('cita > ? and cita < ?', Time.now, 1.week.from_now)
  def to_s
  servicio.nombre
  end
 

end

class AnimalServicio < ActiveRecord::Base
  attr_accessible :animal_id, :client_id, :doctor_id, :pago, :servicio_id,:factura_attributes


validates_presence_of  :doctor_id,:servicio_id , :message => " error!! Campo requerido" 
   
    
 belongs_to :animal
  belongs_to :servicio
 belongs_to :doctor

    has_many :factura, :dependent => :destroy
     accepts_nested_attributes_for :factura, :allow_destroy => true
 
        

  def to_s
  servicio.nombre
  end

end

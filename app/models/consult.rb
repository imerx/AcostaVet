class Consult < ActiveRecord::Base
  attr_accessible :comentarios, :doctor_id, :receta_id, :servicio_id, :vacuna_id,:animal_id,:precio_servicio,:status,:pagado


    validates_presence_of :precio_servicio ,:doctor_id, :servicio_id,  :message => " error!! Campo en blanco"  


  belongs_to :animal
  belongs_to :doctor
  belongs_to :servicio


 

  scope :servicio_hoy
  scope :pagado, where(:status => true)
  scope :pendiente, where(:status => false)
  PAGADO = "pagado"
  PENDIENTE = "pendiente"

  def state
   self.status?  ?  PAGADO : PENDIENTE
  end

  def self.servicio_hoy
    where("created_at >= ? ", Date.today)
  end
 
  def self.pago
    where("pagado = ? ", 'true')
  end


  def self.no_pago
    where("pagado = ? ", 'false')
  end
     

 amount = 0
end

class Factura < ActiveRecord::Base

  attr_accessible :animal_id, :client_id, :commentario, :pagado, :precio,:iva, :total, :user_id,:animal_vacuna_id,:animal_servicio_id,:servicio_id

   validates_presence_of  :client_id,:precio,:total,  :message => " error!! Campo en blanco"  


  belongs_to :user
  belongs_to :client
  belongs_to :servicio ## no se esta usando
  belongs_to :animal_vacuna
  belongs_to :animal_servicio

    
  scope :facturado, where('pagado is not null')
  scope :pendiente, where('pagado is  null')
  scope :servicio_hoy ,where("created_at >= ? ", Time.current.to_date)
  #scope :actualizado_hoy ,where("updated_at >= ? ", Time.current.to_date)
  scope :vacunas,  where("animal_vacuna_id IS NOT NULL")
   

 def invoice_location
    "#{Rails.root}/pdfs/invoice-#{self.id}.pdf"
  end


    def this_month
      where('created_at >= ?', Date.new(Time.now.year, Time.now.month, 1).to_datetime)
    end


end

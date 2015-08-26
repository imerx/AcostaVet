class ExperienciaTrabajo < ActiveRecord::Base
  attr_accessible :date, :descripcion, :nombre ,:doctor_id,:foto_trabajo_attributes

   belongs_to :doctor
    
    has_many :foto_trabajo, :dependent => :destroy
accepts_nested_attributes_for :foto_trabajo, :allow_destroy => true
   

end

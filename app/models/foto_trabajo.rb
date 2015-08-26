class FotoTrabajo < ActiveRecord::Base
  attr_accessible :foto, :titulo ,:experiencia_trabajo_id
  
   belongs_to :experiencia_trabajo
     
  mount_uploader :foto, FotoUploader



end

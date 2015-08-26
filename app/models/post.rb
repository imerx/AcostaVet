class Post < ActiveRecord::Base
  attr_accessible :comentario, :honeyput, :servicio, :username ,:created_at

  validates_presence_of  :comentario, :username,  :message => " error!! Campo en blanco"  
end

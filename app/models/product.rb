class Product < ActiveRecord::Base

	

 attr_accessible :title, :description, :author, :price, :featured, :available_on, :image_file_name,:proveedor_id, :ubicacion_id, :categoria_producto_id
  # Named Scopes
  scope :disponible, lambda{ where("available_on < ?", Date.today) }
  scope :drafts, lambda{ where("available_on > ?", Date.today) }

  # Validations
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :image_file_name


belongs_to :proveedor
belongs_to :ubicacion
belongs_to :categoria_producto

 mount_uploader :image_file_name, FotoUploader



end

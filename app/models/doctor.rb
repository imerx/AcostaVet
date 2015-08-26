class Doctor < ActiveRecord::Base
  attr_accessible :apellido, :celular, :ciudad, :codigo, :direccion, :email, :estado, :nombre, :pais, :rfc, :telefono
  
  has_many :experiencia_trabajo
#has many :animal_vacuna
 

has_many :animal_servicios
has_many :factura, :through => :animal_servicios

has_many :animal_vacunas
has_many :factura, :through => :animal_vacunas


  def to_s
  nombre
  end

def to_s
  apellido
  end


validates_presence_of  :nombre, :apellido,  :message => " error!! Campo en blanco"  
  validates_length_of :nombre, :within => 2 ..50, :message => "Acepta  minimo 2 caracteres" 
  validates_uniqueness_of :telefono, :email , :allow_blank => true ,:message => "error!! Ya  existe un  alguien con esta informacion" 
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true ,:on => :create
  validates_format_of :nombre, :apellido, :direccion,:ciudad,:pais, :with =>/^[a-zA-Z . ' 0-9]+$/x, :message=>"solo caracteres alfanumericos  estan permitidos ,favor de verificar tus datos"
  validates_format_of :telefono,  :with => /^[\(\)0-9\- \+\.]{10,20}$/ ,:message => "solo formato telefonico porfavor " 
  validates_format_of :celular,  :with => /^[\(\)0-9\- \+\.]{10,20}$/,:allow_blank => true ,:message => "Favor de verificar tu telefono mobil  " 
  #validates_presence_of :celular, :if => lambda { telefono.blank?},:message => "debe proporcionar un numero telefonico" 
  validates_length_of :codigo, :is => 5,:message => "solo 5 numeros porfavor" 


end

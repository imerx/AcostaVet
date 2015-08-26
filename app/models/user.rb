class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, 
  #        :recoverable, :rememberable, :trackable, :validatable
   has_many :orders, :dependent => :destroy


   has_many :facturas



  devise :database_authenticatable, :registerable,
       :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :client_id,:username,:email, :password, :password_confirmation, :remember_me, :role_ids,:username
   # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  
  has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

end


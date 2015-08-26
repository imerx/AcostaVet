class Role < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :name
  has_and_belongs_to_many :users

  validates_presence_of :name

  scope :by_name, lambda {|role_name| where(name: role_name)}
end

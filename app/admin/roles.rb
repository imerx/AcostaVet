ActiveAdmin.register Role do
config.filters = false
menu :parent => "Administrar"
	index do
    	column :name
    	column "Created At", :created_at
  	end
end

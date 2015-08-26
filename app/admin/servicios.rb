ActiveAdmin.register Servicio do
	
   menu :parent => "Administrar"

   #form
   form do |f|
         f.inputs "servicio" do
         f.input :nombre      
         f.input :descripcion
         f.input :clave
         f.input :precio, :label => 'costo del servicio'
          end

    
         f.buttons
        end


  #filter


  filter :nombre
end

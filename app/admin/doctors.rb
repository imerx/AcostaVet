ActiveAdmin.register Doctor do

  config.filters = false

  menu :label => " Doctores"
index do
   column :rfc    
    column :nombre do |field|
     "#{field.nombre} #{field.apellido}"
    end
    column :telefono

    column "Doctor"do |doctor|
       link_to("Ver", admin_doctor_path(doctor)) + " | " + \
       link_to("Editar", edit_admin_doctor_path(doctor)) + " | " + \
       link_to( "Borrar", admin_doctor_path(doctor), :method => :delete, :confirm => "Estas seguro?")
       #strong { link_to "View All Products", admin_animal_path }
       end


  end
  
end

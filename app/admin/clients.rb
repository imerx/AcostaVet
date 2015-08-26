ActiveAdmin.register Client do

    menu :label => " Clientes"

    ##SCOPES###########

    scope :all, :default => true

     scope :hoy do |clientes|
    clientes.where("created_at > ?", Date.today)
  end



  ###action ITEMS----###########
   action_item do
   # link_to "Nueva Mascota", new_admin_animal_path(client) 
  end 

   #action_item do
   # link_to('Registrar Cita', new_event_path)
 # end 
  #action_item do
   # link_to('ver calendario', calendars_path)
  #end 
 
  
# clients index
  index do

   column :id    
    column :nombre do |field|
     "#{field.nombre} #{field.apellido}"
    end
    column :pais
    column :nombre do |field|
     "#{field.telefono} -#{field.celular}"
    end
      column "cliente"do |client|
       link_to("Ver", admin_client_path(client)) + " | " + \
       link_to("Editar", edit_admin_client_path(client)) + " | " + \
       link_to( "Borrar", admin_client_path(client), :method => :delete, :confirm => "Estas seguro?")
       
       end
              
               # lista de animal en index

  column "Mis mascotas"  do |client| 
    panel "" do    
          unless client.animals.empty?             
               table_for client.animals.order('id  ASC') do 

                 column "Nombre"do |animal|                  
                   link_to animal.nombre, [ :admin,  client ,animal ]
                   end    

                   end  #table             
                 end  #unless
                 
                 div do
                  link_to "Agregar mascota", new_admin_animal_path(  {:client_id => client.id})
                 end

               end  #panel
             end  #column        
     
   end #index

  #################   fin index cliente  ###########>>>

  #  mostrar 

    show :client => :cliente do

      panel "Detalle cliente" do
        attributes_table_for client do
        row("Nombre") { client.nombre }
        row("Apellido") { client.apellido }        
        row("pais") { client.pais}
        row("Estado") { client.estado }
        row("Direccion") { client.direccion }
        row("Codigo Postal") { client.codigo }        
        row("Telefono") { client.telefono }unless client.telefono.nil?
        row("Celular") { client.celular }unless client.celular.empty?
        row("email") { client.email }unless client.email.nil?
        row("mascotas") { client.animals.count }
           end
         end #panel

    panel "Mis Mascotas" do
     unless client.animals.empty?   
       table_for(client.animals) do        
        column("id", :sortable => :id) {|animal| link_to "#{animal.id}", admin_client_animal_path(client,animal) }
        column("nombre", :sortable => :id) {|animal| link_to "#{animal.nombre}", admin_client_animal_path(client,animal) }
        column("fecha de nacimiento", :sortable => :id) {|animal| link_to "#{animal.nacio_el}", admin_client_animal_path(client,animal) }
       end #table       
         end  #unless

           div do
             #link_to "Agregar mascota", new_admin_animal_path(  {:client_id => client.id})
             link_to 'Agregar Mascota', new_admin_client_animal_path(client)
            end
       end  #panel

       end # end show

           ##########  formulario registrar cliente ############### 
     form do |f|
      f.inputs "Client" do
      f.input :nombre
      f.input :apellido
      f.input :direccion
      f.input :pais , :as => :radio, :label => "Pais", :collection => [["Estados Unidos", 'USA'], ["Mexico", 'Mex']]  
      f.input :estado
      f.input :ciudad
      f.input :codigo     
      f.input :telefono
      f.input :celular      
       end
      f.buttons
     end
  
    ###########filtros de busqueda##############
    
  filter :telefono
  filter :id 


  filter :apellido
 

end

ActiveAdmin.register Animal do

 #belongs_to :client
 menu :parent => "Clients" 
 

 scope :all, :default => true
  scope :servicios_hoy do |animal_vacunas|
    animal_vacunas.where("created_at > ?", Date.today)
  end

  
  ###action ITEMS----###########

   
  
  
  # INICIA METODO INDEX  >>>>>>>>>>>>
  
 index do
     column("cliente", :client, :sortable => :client_)     
     column :id
     column :nombre            
        
        column "Consulta" do |animal|           
         link_to ' historia de consulta', new_admin_animal_animalhistory_path(animal)
       end
       column "vacunas" do |animal|      
           link_to 'Aplicar Vacuna', new_admin_animal_animal_vacuna_path(animal)
         end
        column "servicios" do |animal|      
           link_to 'Registrar servicio', new_admin_animal_animal_servicio_path(animal)
         end  
         column "cliente"do |animal|
       link_to("Ver", admin_animal_path(animal)) + " | " + \
       link_to("Editar", edit_admin_animal_path(animal)) + " | " + \
       link_to( "Borrar", admin_animal_path(animal), :method => :delete, :confirm => "Estas seguro?")
       
       end      
  end

  # <<<<<<<<<<<<<<<<  TERMINA INDEX

 ####  INICIA METODO SHOW   >>>>>>>>>>>>>>>>>>>>>>

 show :animal => :animal do
     
    panel "Detalle animal" do
         attributes_table_for animal do         
         row("cliente ") { link_to (animal.client.nombre),admin_client_path(animal.client)}
         #row("id animal") { animal.id}
         row("Nombre  de mascota") {animal.nombre }
         row("Raza") { animal.raza}  
         row("Genero") { animal.sexo} 
         row("Color") { animal.color} 
         row("Signos Particulares") { animal.comentario}   unless animal.comentario.empty?                 
    end      



  end

          ## inicia tabla  historial medico    ##

   panel " HISTORIAL MEDICA" do

      table_for animal.animalhistories.order('id ASC') do          
            column "Fecha" do |animal_history|
              link_to animal_history.created_at.strftime('%b %-d %Y'),[ :admin,animal, animal_history]
               end      
            column :observaciones
            column :peso
            column :temperatura

             column "Ver / Editar" do |animal_history|
               link_to "Detalle",[ :admin,animal, animal_history]
                  end                   
       end  # table _for servicios

           ##nested link-animal-servicios------------>>
            attributes_table_for animal do 
               row :historial do |historial| 
                link_to " Agregar nuevo historial", new_admin_animal_animalhistory_path(animal)
                #link_to "agregar", new_admin_animal_animalhistory_path(animal)
               end               
            end 

      end #panel   
    ### end  table historial medico  ##     



   ## inicia tabla  vacunas    ##

   panel " CARTILLA_DE_VACUNACION" do

       table_for animal.animal_vacunas do            
            column "Fecha" do |animal_vacuna|
              link_to animal_vacuna.created_at.strftime('%b %-d %Y'),[ :admin,animal, animal_vacuna]
               end 
            column("Vacuna") {|tt| auto_link tt.vacuna.nombre }     
            column("Doctor") {|tt| auto_link tt.doctor.nombre }
            
             column "proxima cita" do |animal_vacuna|
                   link_to animal_vacuna.cita,[ :admin,animal, animal_vacuna]
                   end
            
             column "Ver / Editar" do |animal_vacuna|
               link_to "Detalle",[ :admin,animal, animal_vacuna]
                  end                   
       end  # table _for vacunas

           ##nested link-animal-servicios------------>>
            attributes_table_for animal do 
              row :consulta do |animal_vacuna| 
              link_to 'Vacunar Mascota', new_admin_animal_animal_vacuna_path(animal)
              end              
            end 

      end #panel   
    ### end  table  vacunas  ##     


   ## inicia tabla  servicios     ##

   panel " HISTORIAL DE  SERVICIOS" do

       table_for animal.animal_servicios do            
            column "Fecha" do |animal_servicio|
              link_to animal_servicio.created_at.strftime('%b %-d %Y'),[ :admin,animal, animal_servicio]
               end      
            column("Doctor") {|tt| auto_link tt.doctor.nombre }
            column :servicio

             column "Ver / Editar" do |animal_servicio|
               link_to "Detalle",[ :admin,animal, animal_servicio]
                  end                   
       end  # table _for servicios

           ##nested link-animal-servicios------------>>
            attributes_table_for animal do 
              row :consulta do |animal_servicio| 
              link_to 'Agregar una Consulta', new_admin_animal_animal_servicio_path(animal)
              end              
            end 

      end #panel   
    ### end  table  servicios  ##         
       
                   
    end
   # <<<<<<<<<<<<<< TERMINA METODO SHOW
       
##############  INPUT FORM  ANIMAL >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

form do |f|
         f.inputs "animal" do 
         #f.input :client  , :collection => Client.all.map.map{|u| ["ID-#{u.id},#{u.nombre}, #{u.apellido}", u.id]}    unless params['client_id'].present?     
         f.input :client_id,:include_blank => false,:hint => "Teclee ID del cliente  o ir a MENU CLIENTES "  unless params['client_id'].present?
         f.input :client,:include_blank => false,:collection => Client.where(:id =>params['client_id'] ) unless params['client_id'].nil?
         f.input :category,:label => "Tipo de Animal",:as => :radio, :collection => Category.all.map{|u| [u.nombre, u.id]}
         f.input :nombre         
         f.input :nacio_el ,:as => :datepicker
         f.input :sexo, :as => :radio, :label => "Genero", :collection => [["Masculino", 'M'], ["Femenino", 'F']]  
         f.input :raza
         f.input :color
         f.input :comentario , :label  =>"Signos particulares?",:input_html => { :size => '80x5' }
   
   #logs for refernces
         #f.input :client,:rescue nil,:collection => Client.where(:id =>params['client_id'] ).all.map{|u| [u.nombre, u.id]}
         #f.input  :client_id,:as => :hidden,  :required => true, :input_html => { :value => params['client_id'] },disabled: true, hint: 'You cannot change your username.'
         #f.input :client, :input_html => { :disabled => @client.id }
          end
         f.buttons :commit
        end

sidebar "Datos importantes", :only => :show do
    attributes_table_for animal do
        row("cliente ") { link_to (animal.client.nombre),admin_client_path(animal.client)}
         #row("cliente id") { animal.client.id}
         row("id animal") { animal.id}
         row("Nombre  de mascota") {animal.nombre }                         
         row ("nacio"){(animal.nacio_el) }
         row ("edad en anios") {(Date.today ).year - (animal.nacio_el).year - (((Date.today ).month > (animal.nacio_el).month || ((Date.today ).month == (animal.nacio_el).month && (Date.today ).day >= (animal.nacio_el).day)) ? 0 : 1)}
         row ("edad en meses"){ (Date.today.month + (12 * Date.today.year)) - ((animal.nacio_el.month)  + (12 * (animal.nacio_el).year))}
         row ("edad en semanas"){(((Date.today )-(animal.nacio_el)).to_i)/7}
         row ("edad en dias"){((Date.today )-(animal.nacio_el)).to_i}
         row("vacunas Aplicadas") { animal.animal_vacunas.count } unless animal.animal_vacunas.blank?
         row("Otros servicios") { animal.animal_servicios.count }  unless animal.animal_servicios.blank?
    end      
  end


  filter :id

  



## final ending
end
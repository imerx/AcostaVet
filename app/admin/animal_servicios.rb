ActiveAdmin.register AnimalServicio do

	
  belongs_to :animal

  #  show --------->>
  show :servicios => :animal_servicio do

      panel "cartilla" do
        attributes_table_for animal_servicio do
         row("animals"){ link_to "#{animal.nombre}", admin_client_animal_path(  animal.client_id,animal) }
         row("animal id") { animal_servicio.animal_id}  
         row("Servicio") { animal_servicio.servicio.nombre}
         row("doctor") { animal_servicio.doctor.apellido}
         row("fecha") { animal_servicio.created_at}          
        # row("proxima cita") { animal_servicio.cita}          
              end
           end           
         end

   
 ######### new form input>>>>>>>>>>
    form do |f|
         f.inputs "cartilla" do  
          f.input :animal,:input_html => { :disabled => true }        
          f.input  :doctor  , :collection => Doctor.all.map.map{|u| ["#{u.nombre}, #{u.apellido}", u.id]} 
          f.input :servicio,:collection => Servicio.find(:all, :conditions => ["nombre NOT IN (?)", ["vacunas","VACUNAS"]]),:hint => "IMPORTANTE!!!   REGISTRE LA FACTURA A CONTINUACION"
                
                f.inputs  do 
                  f.has_many :factura   do |ff|                                 
                                          
                         ff.input :client ,:include_blank => false , :collection => Animal.where(:client_id =>("#{animal.client.id}")).limit(1).map{|u| ["#{u.client.nombre}, #{u.client.apellido}", u.client_id]}                                
                          # ff.input :servicio,  :collection => Servicio.find(:all, :conditions => ["nombre IN (?)", ["vacunas","VACUNAS"]])
                          ff.input :user_id , :as => :hidden, :value => current_user.id
                          ff.input :precio ,:include_blank => false,:hint => " el precio de la vacuna o servicio"    
                          ff.input :iva  ,:hint => "IVA del producto"                   
                          ff.input :total ,:include_blank => false,:hint => " el precio + iva"                            
                          ff.input :commentario
                     
                   end
                  end                

          end
         f.buttons
        end


end

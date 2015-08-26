ActiveAdmin.register AnimalVacuna do
  menu :parent => "animals"

belongs_to :animal
  
  scope :all, :default => true    

#show 
show :vacunas => :animal_vacuna do

      panel "cartilla" do
        attributes_table_for animal_vacuna do
         row("animal"){ link_to "#{animal.nombre}", admin_client_animal_path(  animal.client_id,animal) }
         row("animal id") { animal_vacuna.animal_id}  
         row("vacuna") { animal_vacuna.vacuna.nombre}
         row("doctor") { animal_vacuna.doctor.apellido}
         row("fecha") { animal_vacuna.created_at}          
         row("proxima cita") { animal_vacuna.cita}          
              end
           end           
         end


form do |f|
         f.inputs "cartilla" do 
          
          f.input :servicio, :include_blank => false, :collection => Servicio.find(:all, :conditions => ["nombre IN (?)", ["vacunas","VACUNAS"]])  
          f.input :animal,:input_html => { :disabled => true }
          f.form_buffers.last << f.template.content_tag(:li,f.template.content_tag(:label, " La edad de esta mascota  en semanas es :")+ f.template.content_tag(:p,(((Date.today )-(animal.nacio_el)).to_i)/7)) 
          f.input :vacuna , :collection => Vacuna.where(:category_id =>("#{animal.category.id}")).map{|u| ["#{u.nombre}, #{u.periodo_vacunacion}", u.id]} ,:hint => " Elige la vacuna correspondiente"        
          f.input :cita,:label => 'Proxima vacuna', :as => :datepicker,:hint => "Citas  cada 3 semanas"            
          f.input  :doctor ,:include_blank => false , :collection => Doctor.all.map{|u| ["#{u.nombre}, #{u.apellido}", u.id]} ,:hint => "IMPORTANTE!!!  REGISTRE LA FACTURA A CONTINUACION" 
          
          
                f.inputs  do 
                      #### NOTA  LOS HINTS =>  HAN SIDO CAMBIADOS  EN LOS TEXFIELDS
                  f.has_many :factura , heading: false, allow_destroy: true do |ff| 
                         ff.input :user_id , :as => :hidden, :value => current_user.id                         
                         ff.input :client ,:include_blank => false , :collection => Animal.where(:client_id =>("#{animal.client.id}")).limit(1).map{|u| ["#{u.client.nombre}, #{u.client.apellido}", u.client_id]}  ,:hint => " el precio de la vacuna o servicio"                                 
                         # ff.input :servicio,  :collection => Servicio.find(:all, :conditions => ["nombre NOT IN (?)", ["vacunas","VACUNAS"]])
                          #ff.input :servicio,  :collection => Servicio.find(:all, :conditions => ["nombre IN (?)", ["vacunas","VACUNAS"]])
                          
                          ff.input :precio ,:include_blank => false   ,:hint => "IVA del producto"  
                          ff.input :iva     ,:hint => " el precio + iva"              
                          ff.input :total ,:include_blank => false                           
                          ff.input :commentario
                        end
                end                

          end
         f.buttons
        end

  sidebar "Detalle cliente", :only => :show do
    attributes_table_for animal do
     row("nombre") {  animal_vacuna.animal.client.nombre+"    "+animal_vacuna.animal.client.apellido}
     row("Telefono") {  animal_vacuna.animal.client.telefono}
   end
  end





filter :id






end

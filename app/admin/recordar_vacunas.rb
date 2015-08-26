ActiveAdmin.register AnimalVacuna , :as => "Proximas vacunas" do
  menu :parent => "clients"

actions :all, :except => [:destroy,:new]
  
  scope :all, :default => true
  scope :citas_proximas


  #show
 
 
#  index
index do
     column :id
     column 'cliente' do |c| 
       "#{c.animal.client.nombre} #{c.animal.client.apellido}"
      end
      column 'Telefono' do |c| 
       "#{c.animal.client.telefono} ,#{c.animal.client.celular}"
      end
     
     column :animal, :sortable => :animal_id
     column :cita     
     default_actions
     
    
end
# NEW form input >>>>>>>>>>
form do |f|
         f.inputs "cartilla" do  
          f.input :animal, :include_blank => false,:input_html => { :disabled => true }

         #f.form_buffers.last << f.template.content_tag(:li,f.template.content_tag(:label, " La edad de esta mascota  en semanas es :")+ f.template.content_tag(:p,(((Date.today )-(animal.nacio_el)).to_i)/7)) 
          f.input :servicio,  :include_blank => false,:input_html => { :disabled => true }
          f.input :vacuna               
          f.input :cita,:label => 'Proxima vacuna', :as => :datepicker           
          f.input  :doctor  , :collection => Doctor.all.map{|u| ["#{u.nombre}, #{u.apellido}", u.id]} 
         
          
               end
         f.buttons
        end
  

# <<<<<<<<<<<  end input form
  filter :doctor
  filter :vacuna
  filter :created_at,:label => "Fecha creado"
  filter :updated_at,:label => "Fecha Actualizado"
  filter :cita
end

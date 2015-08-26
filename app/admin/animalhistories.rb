ActiveAdmin.register Animalhistory do
  menu :parent => "animals"
  belongs_to :animal
  #actions  :index, :edit, :show, :update , :new

index do

	 column :id
   column :observaciones
   column :historia
	 column :peso
	 column :temperatura
	 
   
  default_actions
end

show :animalhistory=> :animalhistory do
         panel "Detalle de Historial" do
         attributes_table_for animalhistory do
         #row("cliente") { animal.client.nombre}
         row("animal"){ link_to "#{animal.nombre}", admin_client_animal_path(  animal.client_id,animal) }
         row("peso ") {animalhistory.peso }
         row("temperatura") { animalhistory.temperatura}  
         row("observaciones") { animalhistory.observaciones} 
         row("Historial") { animalhistory.historia}  
         #row("id  Historial") { animalhistory.id} 

           end
         end
       end



       form do |f|
         f.inputs "animalhistory" do
           #       f.input :animal, :collection => Category.all.map{|u| [u.nombre, u.id]}
         f.input :peso
         f.input :temperatura
         f.input :observaciones 
         f.input :historia 
         #f.input :animal
         #f.input  :animal_id,:as => :hidden,  :required => true, :input_html => { :value => params['animal_id'] }
         #:wrapper_html => { :style => "display:none;" } 
         
          end
         f.buttons
        end

        sidebar "Detalle cliente", :only => :show do
    attributes_table_for animal do
     row("nombre") {  animalhistory.animal.client.nombre+"    "+animalhistory.animal.client.apellido}
     row("Telefono") {  animalhistory.animal.client.telefono}
   end
  end

end

ActiveAdmin.register Post , :as => "Comentarios" do


	menu :parent => "Clients"
	

scope :all, :default => true
 scope :hoy do |f|
    f.where("created_at > ?", Date.today)
    end  
	
    config.batch_actions = true

    #  index
    index do
   selectable_column
    column :id  	
   column :username
   column :servicio
   column :comentario
   column :created_at 

   column "Comentarios"do |post|
       link_to("Detalle", admin_comentario_path(post)) + " | " + \
       link_to("Editar", edit_admin_comentario_path(post)) + " | " + \
       link_to( "Borrar", admin_comentario_path(post), :method => :delete, :confirm => "Estas seguro?")
              end
   end
#input
     form do |f|
      f.inputs "Comentarios" do
      f.input :username
      f.input :servicio
      f.input :comentario        
       end
      f.buttons
     end

### filters
filter :username
filter :created_at

end

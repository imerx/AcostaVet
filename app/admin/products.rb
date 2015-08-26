ActiveAdmin.register Product do
   menu :label => " Almacen"

  # scopessssss >>>>>>>>>>>
  scope :all, :default => true
  scope :disponible do |products|
    products.where("available_on < ?", Date.today)
  end
  #scope :drafts do |products|
   # products.where("available_on > ?", Date.today)
  #end  
  scope :destacados do |products|
        products.where(:featured => true)
  end
    
#index>>>>>>>>>>>>>
index do
    column("Nombre", :title)
    column("Descripcion", :description) 
    column("Registrado por?", :author)
    column("Precio", :price)
    column("Destacado", :featured)
    column("Fecha disponible", :available_on)     
    column "Foto" do |image|
          image_tag image.image_file_name.url(:small_thumb).to_s
        end
     column "Producto"do |product|
       link_to("ver", admin_product_path(product)) + " | " + \
       link_to("Editar", edit_admin_product_path(product)) + " | " + \
       link_to( "Borrar", admin_product_path(product), :method => :delete, :confirm => "Estas seguro?")      
       end


  end




  #show >>>>>>>>>>>>>>>>>>  

  show do |product|
  attributes_table do        
        row :image_file_name do
          #image_tag(product.image_file_name)
          image_tag product.image_file_name.url(:thumb).to_s
        end
        row("Nombre") { product.title }
        row("Descripcion") { product.description }
        row("Precio") { product.price}
        row("Disponible el?") { product.available_on }
        row("Es destacado") { product.featured }
        row("Descripcion") { product.description }       
        row("ubicacion") { product.ubicacion.slot}
        row("Registrado por") { product.author }                      
        end
      end

  sidebar :product_stats, :only => :show do
    attributes_table_for resource do
      row("Total Venta")  { Order.find_with_product(resource).count }
      row("Dollar Valor "){ number_to_currency LineItem.where(:product_id => resource.id).sum(:price) }
    end
  end

  sidebar :recent_orders, :only => :show do
    Order.find_with_product(resource).limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag("br")).html_safe
  end

########## inputs form >>>>>>>>>>>>>>>
form do |f|
      f.inputs "Productos" do
      f.input :title, :label => "Nombre"
      f.input :proveedor, :collection => Proveedor.all.map{|u| [u.nombre, u.id]}
      f.input :ubicacion ,:collection => Ubicacion.all.map{|u| [u.slot, u.id]}
      f.input :categoria_producto
      f.input :author, :as => :hidden, :value => current_user.username
      #f.input :author,:as => @current_user, :label => "Usuario que registra el articulo"
      #f.input  :author,:value => proc { current_user.username }, :as => :hidden
      f.input :price, :label => "Precio"
      f.input :available_on ,:as => :datepicker, :label => "Disponible"
      #f.input :image_file_name , :label  =>" Nombre de Imagen"  
      f.input :image_file_name,:label  =>"Buscar imagen?", :as => :file, :hint => f.object.image_file_name? ? f.template.image_tag(f.object.image_file_name.url(:thumb).to_s) : nil  
      f.input :featured, :label  =>"Producto Destacado?"
      f.input :description,   :label => "Descripcion"
       end
     f.buttons
     end

     #filters >>>>>>>

     filter :category
     filter :proveedor
     filter :ubicacion


end

#ActiveAdmin.register Ventas do
  ActiveAdmin.register Product, :as => "Ventas" do

    menu :label => " Tienda"

    config.clear_action_items!
  actions :all, :except => [:new ]

  
  scope :all, :default => true
  scope :disponible do |products|
    products.where("available_on < ?", Date.today)
  end
  scope :drafts do |products|
    products.where("available_on > ?", Date.today)
  end
  
  scope :destacados do |products|
        products.where(:featured => true)
  end

  
#index :as => :grid ,:only => :show  do |product|
  #link_to(image_tag(product.image_file_name), admin_venta_path(product))   
      #end
      index :as => :grid ,:only => :show  do |product|
    div do
      a link_to(image_tag(product.image_file_name.url(:small_thumb).to_s), admin_venta_path(product))
    end
    div do
      a truncate(product.title), :href => admin_venta_path(product)
      end      
      div :class => "price" do
        number_to_currency product.price
      end
end


show do |product|
  attributes_table do        
        row :image_file_name do
          #image_tag(product.image_file_name)
          image_tag product.image_file_name.url(:thumb).to_s
        end
        row("Nombre") { product.title }
        row("Descripcion") { product.description } unless product.description.empty?
        row("Precio") { product.price}
        row("Disponible el?") { product.available_on }
        row("ubicacion") { product.ubicacion.slot}               
        row :Add_to_cart  do
          link_to 'vender', cart_path(product)
         #link_to "Add to Card", add_to_cart_path(:Admin ,@product.id)
         link_to "Agregar Producto", add_to_cart_path(product.id) 
        end
      end
            
        


      active_admin_comments
     

    end

   filter :proveedor
   filter :ubicacion
   

end

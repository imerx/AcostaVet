ActiveAdmin.register User, :as => "Agente" do
   
  menu :parent => "Ventas"
   

  actions :all, :except => [:edit ,:new,:destroy]

  config.batch_actions = true

  filter :username
  filter :email
  filter :created_at

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :created_at
    default_actions
  end

  show :title => :username do
    panel "Historal de ordenes" do
      #table_for(customer.orders) do
        table_for(agente.orders) do
        column("Orden", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
        column("Estado")                   {|order| status_tag(order.state) }
        column("Fecha", :sortable => :checked_out_at){|order| pretty_format(order.checked_out_at) }
        column("Total")                   {|order| number_to_currency order.total_price }
      end
    end
    active_admin_comments
  end

  sidebar "Detalle", :only => :show do
    attributes_table_for agente, :username, :email, :created_at
  end

  sidebar "Historial de ordenes", :only => :show do
    attributes_table_for agente do
      row("Total de Ordenes") { agente.orders.complete.count }
      row("Valor Total") { number_to_currency agente.orders.complete.sum(:total_price) }
    end
  end

  #sidebar "Active Admin Demo" do
    #render('/admin/sidebar_links', :model => 'users')
  #end
end

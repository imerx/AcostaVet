ActiveAdmin.register Order do
   
  menu :parent => "Ventas"
   
  actions :index, :show


  scope :all, :default => true
  scope :in_progress
  scope :complete
  scope :hoy do |orders|
    orders.where("checked_out_at > ?", Time.zone.now.beginning_of_day)
  end

    

  index do
    column("Orden", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("Estado")                  {|order| status_tag(order.state) }
    column("Fecha", :checked_out_at)
    column("Usuario", :user, :sortable => :user_id)
    column("Total")  {|order| number_to_currency order.total_price }
  end

  show do
    panel "Factura" do
      table_for(order.line_items) do |t|
        t.column("Productos") {|item| auto_link item.product        }
        t.column("Precio")   {|item| number_to_currency item.price }
        tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
          td number_to_currency(order.total_price)
        end
      end
    end

    active_admin_comments
  end

  sidebar :customer_information, :only => :show do
    attributes_table_for order.user do
      row("vendedor") { auto_link order.user }
      end
  end

 # sidebar "links" do
  #  render('/admin/sidebar_links', :model => 'orders')
  #end

filter :checked_out_at, :label => "Comprado en"
filter :total_price, :label => "Precio total"

end

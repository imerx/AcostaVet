ActiveAdmin.register_page "Dashboard" do

  content :title => proc{ I18n.t("active_admin.dashboard") } do

              #= e.from_time.strftime('%I:%M %p')
            #  = '-'
             # = e.to_time.strftime('%I:%M %p')

    columns do

      column do
    panel "CITA ACTUAL" do 
     table_for Event.where("from_date >= ? or to_date >= ?", Time.zone.now.beginning_of_day, Time.zone.now.beginning_of_day).limit(5) do  
       column("nombre",:name) 
       column "DE" do |e|
       e.from_date.strftime('%b %-d %Y')
        end 
        column "HORA" do |e|
       e.from_time.strftime('%H:%M:%S:%p')#+"-" + e.to_time.strftime('%H:%M:%S:%p')
         end 
       column "A" do |e|
       e.to_date.strftime('%b %-d %Y')#+"-" + e.to_time.strftime('%H:%M:%S:%p')
         end  
           column "HORA" do |e|
       e.to_time.strftime('%H:%M:%S:%p')#+"-" + e.to_time.strftime('%H:%M:%S:%p')
         end 
       end 
          div do                                                                   
          strong { link_to "Citas ", admin_citas_path ,:style => "text-align:left;"  }                                     
        end        
        strong { link_to " Calendario", calendars_path }
     end
    end


          
       column do
        panel "VENTAS DE HOY" do
          table_for Order.complete.where("checked_out_at >= ?",Time.zone.now.beginning_of_day).limit(10) do |t|
           t.column("vendio", :user, :sortable => Time.zone.now.beginning_of_day)
           t.column("estado")   {|order| status_tag(order.state) } 
           t.column("fecha",:checked_out_at)
           t.column("total orden",:total_price)          
           end
           table_for Order.complete.where("checked_out_at >= ?",Time.zone.now.beginning_of_day).limit(1) do |t|           
           t.column("total ") { number_to_currency Order.complete.where("checked_out_at >= ?", Time.zone.now.beginning_of_day).sum(:total_price)}           
           end
            strong { link_to "Ir a productos vendidos ", admin_orders_path }
        end
      end


    end # columns
    ############  citas- ventas ############

    columns do

     
      column do
        panel "SERVICIOS REGISTRADOS HOY" do
         table_for Factura.facturado.where("created_at >= ? or updated_at >= ?", Time.zone.now.beginning_of_day, Time.zone.now.beginning_of_day) do |t|              
          t.column :fecha, :sortable => :created_at do |resource|
           resource.created_at.strftime('%b %-d %Y, %l %P')
           end
          t.column 'Cliente' do |c| 
           "#{c.client.nombre} #{c.client.apellido}"
            end
          t.column :servicios do |s|
           "#{s.animal_vacuna} #{s.animal_servicio}"
           end
          t.column "Pagos", :sortable => :pagado do |factura|
           status_tag((factura.pagado? ? "Recibido" : "Pendiente"), (factura.pagado? ? :ok : :warning))
           end          
          t.column :precio do |tt|
            number_to_currency tt.precio, :unit => "$"
           end
           
            table_for Factura.facturado.where("created_at >= ? or updated_at >= ?", Time.zone.now.beginning_of_day, Time.zone.now.beginning_of_day) do |t| 
             t.column("total "){number_to_currency Factura.facturado.where("created_at >= ? or updated_at >= ?", Time.zone.now.beginning_of_day, Time.zone.now.beginning_of_day).sum(:precio)} 
             end
      
         end   #table        
        end  # panel
      end  #  end column

      column do
        panel "PENDIENTES DE COBRO" do
         table_for Factura.pendiente do |t|              
          t.column :fecha, :sortable => :created_at do |resource|
           resource.created_at.strftime('%b %-d %Y')
           end
          t.column 'Cliente' do |c| 
           "#{c.client.nombre} #{c.client.apellido}"
            end
          t.column :servicios do |s|
           "#{s.animal_vacuna} #{s.animal_servicio}"
           end
             
          t.column "Pagos", :sortable => :pagado do |factura|
           status_tag((factura.pagado? ? "Recibido" : "Pendiente"), (factura.pagado? ? :ok : :warning))
           end          
          t.column :precio do |tt|
            number_to_currency tt.precio, :unit => "$"
           end
           
            table_for Factura.pendiente.limit(1) do |tt|
             tt.column("total "){  number_to_currency Factura.pendiente.sum(:precio)} 
             end

         end   #table 
          strong { link_to "Ir a facturas ", admin_facturas_path }       
        end  # panel
      end  #  end column    
    end # columns

 columns do
  column do
    panel " VACUANACION" do
      div do
        #link_to('Proximas vacunas', proximas_vacunas_path)
         strong { link_to "Proximas Vacunas", admin_proximasvacunas_path }
      end
       
    end
  end
 end
  
 
  end # content
end

#   user.created_at.strftime('%Y-%m-%d') # if the format is different that expected#
#:format => :long
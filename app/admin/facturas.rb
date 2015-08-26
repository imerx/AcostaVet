def generate_invoice(factura)
  # Generate invoice
  Prawn::Document.generate @factura.invoice_location do |pdf|   
     
     #logo

     logopath =  "#{Rails.root}/app/assets/images/logob.jpg"
      #  company infor
   pdf.text "CLINICA VETERINARIA ACOSTA",:size => 20,:style => :bold,:align => :center
   pdf.text "RFC ACBE670911OOK",:align => :center
   pdf.text "AV.BENITO JUAREZ 175,CIUDAD MORELOS,BC .Cp.21960",:align => :center
   pdf.text "TEL. (658)514-8375",:align => :center

   # Displays the image in your PDF. Dimensions are optional.
     pdf.image logopath, :width => 100, :height => 70 ,:position => 0  
    
  

    pdf.text "FOLIO ##{factura.id}", :size => 20,:style => :bold,:align => :right

    pdf.text "CLIENTE ID #{factura.client_id}",:size => 16,:style => :bold
    
    pdf.text "#{factura.client.nombre} #{factura.client.apellido}"
    pdf.text factura.client.direccion
    pdf.text "#{factura.client.ciudad}, #{factura.client.estado},#{factura.client.pais},#{factura.client.codigo}"
    pdf.text "#{factura.client.telefono} #{factura.client.celular}"
    


    # concept info
     pdf.move_down 30
     #pdf.header2 = ['concepto']  


     if factura.animal_vacuna_id.nil?
           datos =  [["CONCEPTO", "#{factura.animal_vacuna} #{factura.animal_servicio}"]] \
                  + [[ "Animal ID:", "#{factura.animal_servicio.animal.id}"]] \
                + [["fecha:", "#{factura.created_at} "]] \
                 + [[ "Precio:", "#{factura.precio}"]] \
                 + [[ "iva:", "#{factura.iva}"]] \
                  + [[ "Total:", "#{factura.total}"]]

    pdf.table datos, :header => true, :width => pdf.bounds.width do
      row(-4..-6).borders = []
      row(-4..-6).column(2).align = :left
      row(0).style :font_style => :bold
      row(-1).style :font_style => :bold
    end
else
      datos2 =  [["CONCEPTO", "#{factura.animal_vacuna} #{factura.animal_servicio}"]] \
                  + [[ "Animal ID:", "##{factura.animal_vacuna.animal.id}"]] \
                  + [["fecha:", "#{factura.created_at} "]] \
                  + [[ "Precio:", "#{factura.precio}"]] \
                  + [[ "iva:", "#{factura.iva}"]] \
                  + [[ "Total:", "#{factura.total}"]]

    pdf.table datos2, :header => true, :width => pdf.bounds.width do
      row(-4..-6).borders = []
      row(-4..-6).column(2).align = :left
      row(0).style :font_style => :bold
      row(-1).style :font_style => :bold
    end
  end

    pdf.move_down 25
     pdf.text  "comentario: #{factura.commentario}"unless factura.commentario.empty?

    
   

    pdf.move_down 10

    pdf.text  "usuario: #{factura.user.username}"

    # Items
    pdf.move_down 20

    pdf.text  "Gracias por su preferencia ,visita nuestra pagina www.veterinariaacosta.com para  dejar comentarios"

    # Items
   
   
    

    # Footer
    pdf.draw_text "Generado a las #{l(Time.now, :format => :short)}", :at => [0, 0]
  
  end  
end


#--------------------------------------------------------------

ActiveAdmin.register Factura do

actions :all, :except => [:destroy,:new]
  action_item do
   link_to "volver", admin_facturas_path
  end 



#scopes
   scope :all, :default => true
   scope :hoy do |f|
    f.where("created_at > ?",Time.zone.now.beginning_of_day)
    end 
     scope :pagos_de_hoy do |f|
    f.where("created_at >= ? or updated_at >= ?",Time.zone.now.beginning_of_day,Time.zone.now.beginning_of_day)
    end
   scope :facturado
   scope :pendiente
    scope :vacunas

# ----  inicia index ---->

index do
    selectable_column
    id_column
    column :user, :sortable => :user_id

   
      column 'Cliente' do |c| 
       "#{c.client.nombre} #{c.client.apellido}"
      end
       column :servicios do |s|
     "#{s.animal_vacuna} #{s.animal_servicio}"
    end
      
    column "Pagos", :sortable => :pagado do |factura|
      status_tag((factura.pagado? ? "PAGADO" : "PENDIENTE"), (factura.pagado? ? :ok : :warning))
    end
    column :created_at
    column :precio
    column :iva
    column :total
     column "acciones" do |factura|
       link_to("Detalle", admin_factura_path(factura)) + " " + \
       link_to("Editar", edit_admin_factura_path(factura))# + " | " + \
       #link_to( "Borrar", admin_client_path(client), :method => :delete, :confirm => "Estas seguro?")
      end

    
  end


#  <----------termina index ----#


# -----------------------------------------------------------------------------------
  # PDF

  
 def detalle_factura
      pdf.move_down  20

    end

  action_item :only => :show do
    link_to "Generar factura", generate_pdf_admin_factura_path(resource)
  end
  
  member_action :generate_pdf do
    @factura = Factura.find(params[:id])
    generate_invoice(@factura)
    
    # Send file to user
    send_file @factura.invoice_location
  end
    
  # ------------ENDS PDF------------------------------

# --------INICIA SHOW -------->

show as: :block do |factura| 
  
  columns do

     column :max_width => "500px", :min_width => "200px" do

      
      panel "Detalle de cliente" do
        attributes_table_for factura do 
        row("No. DE CLIENTE "){ "#{factura.client.id} "}        
         row("Facturado a "){ "#{factura.client.nombre} , #{factura.client.apellido}"}
         row("Direccion"){ "#{factura.client.direccion} , #{factura.client.ciudad}, #{factura.client.pais},C.P. #{factura.client.codigo}"}
          row("Telefono "){ "#{factura.client.telefono}, #{factura.client.celular}"}          
        end
      end

    end #column1

     column :max_width => "500px", :min_width => "400px" do  

       panel "Detalle de servicio" do
        attributes_table_for factura do
        if factura.animal_vacuna_id.nil?
          row("ID del animal."){ "#{factura.animal_servicio.animal.id}"}          
          row("nombre del paciente"){  "#{factura.animal_servicio.animal.nombre}"}
        else
          row("ID del animal."){ "#{factura.animal_vacuna.animal.id}"}          
          row("nombre del paciente"){  "#{factura.animal_vacuna.animal.nombre}"}
        end
          row("Servicio"){ "#{factura.animal_vacuna} #{factura.animal_servicio}"}   
          row("fecha "){ "#{factura.created_at} "}   
          row("monto"){ number_to_currency"#{factura.precio} "}
                
          tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
          td number_to_currency(factura.total)
          end   

        end
     end


    end  #colum 2
  end #columns

  columns do
    column  do
       panel "Atendido por" do
        attributes_table_for factura do
          row("No. DE empleado "){ "#{factura.user.id} "}
          row("nombre "){ "#{factura.user.username} "} 
          row("comentario "){ "#{factura.commentario} " }  unless factura.commentario.empty?
        end
       end
    end
  end

end #show



#<<-----------------TERMINA SHOW----------

#  ------ INICIA INPUT FORM para cambiar  el estatus de la factura ---->>>>

  form do |ff|
       ff.inputs "Factura" do 
       ff.input :precio , :input_html => { :disabled => true } 
       ff.input :iva , :input_html => { :disabled => true }                    
       ff.input :total  , :input_html => { :disabled => true }    
       ff.input :pagado
       ff.input :commentario
       end
      ff.buttons
     end

#  <<----------TERMINA INPUT FOR-------


filter :created_at,:label => "Creado el"
filter :updated_at,:label => "Actualizado el"
#filter :animal_servicio ,:label => "Servicio"


end

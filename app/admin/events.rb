ActiveAdmin.register Event, :as => "Citas" do


 menu :parent => "Clients" 
  

   config.clear_action_items!
  actions :all, :except => [:new ]

scope :all, :default => true

 
  action_item do
    link_to('Registrar Cita', new_event_path)
  end 
  action_item do
    link_to('ver calendario', calendars_path)
  end 

  scope :hoy do |events|
    events.where("from_date > ?", Time.zone.now.beginning_of_day )
    events.where("to_date > ?", Time.zone.now.beginning_of_day )
  end

 
scope :futuros do |events|
  events.where('from_date > ? and from_date < ?', Time.now, 1.week.from_now)
end

scope :anterior do |events|
  events.where('from_date < ?', Time.now)
end

index do

   column("NOMBRE", :name)
   column("DESCRIPCION", :description)
   column "INICIO" do |e|
     e.from_date.strftime('%b %-d %Y')
     e.from_time.strftime('%H:%M:%S:%p')
    end
    column "TERMINA" do |e|
     e.to_date.strftime('%b %-d %Y')
     e.to_time.strftime('%H:%M:%S:%p')
    end
  # column("DIA_COMPLETO", :is_all_day)
    column "TODO_EL_DIA", :sortable => :is_all_day do |event|
      status_tag((event.not_all_day? ? "NO" : "SI"), (event.not_all_day? ? :ok : :warning))
    end

end

##########  no se requiere  fue sustitido por events/new

form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :from_date, :as => :just_datetime_picker
     
      f.input :to_date ,:as => :just_datetime_picker
    
      f.input :is_all_day
      
    end
    f.buttons
  end






show :event => :event do

      panel "Eventos y Citas" do
        attributes_table_for event do
        row("Nombre") { event.name }
        row("Descripcion"){event.description}
        row ("")
      end
           end
         end #panel


filter :from_date

end

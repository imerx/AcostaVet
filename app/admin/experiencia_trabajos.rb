ActiveAdmin.register ExperienciaTrabajo do
  
  menu :parent => "doctors"


  filter :doctor;
  filter :date;
  filter :nombre;

#index
index do
    column :nombre
    column :descripcion
    column :date
    default_actions
  end

#fomulario inputs
form :html => {:multipart => true} do |f|
    f.inputs "ExperienciaTrabajo" do
      f.input  :doctor ,:include_blank => false , :collection => Doctor.all.map{|u| ["#{u.nombre}, #{u.apellido}", u.id]}
      f.input :nombre
      #f.input :descripcion
      f.input :date, :as => :datepicker
    end

    f.inputs "Fotos" do
      f.has_many :foto_trabajo, :label => 'Imágenes' do |gf|
        gf.input :titulo  , :as => :text      
        gf.input :foto, :as => :file, :hint => gf.object.foto? ? gf.template.image_tag(gf.object.foto.url(:thumb).to_s) : nil
        gf.input :_destroy, :as => :hidden, :value => '0', :input_html => { :class => 'destroy' }
      end
    end
    f.buttons
  end
  
   # => Show
  show :titulo => :date do |gallery|
    panel "Experiencia laboral" do
      attributes_table_for experiencia_trabajo, :nombre,:date
    end

    panel "Fotos" do
      table_for(experiencia_trabajo.foto_trabajo) do

        column "comentario", :titulo
         column "Foto" do |image|
          image_tag image.foto.url(:thumb).to_s
        end
      end
    end

  end

end

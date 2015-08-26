ActiveAdmin.register Vacuna do
 menu :parent => "Administrar"


form do |f|
      f.inputs "vacuna" do
      f.input :servicio
      f.input :category ,:collection => Category.all.map{|u| [u.nombre, u.id]}
      f.input :nombre
      f.input :periodo_vacunacion ,:collection => {'3 - 6 semanas' => '3 - 6 Semanas','6 - 9 semanas' => '6 - 9 Semanas ','9-12 semanas' => '9 - 12 ','12-15 semanas' => '12 - 15  Semanas','15-18 semanas' => '15 - 18  Semanas','18-21 semanas' => '18 - 21  Semanas ','21 semanas en adelante' => "21 mas de Semanas "}
      f.input :descripcion ,:input_html => { :size => '60x2' }
     
      # f.input :category, :collection => Category.all.map{|u| [u.nombre, u.id]}
       end
     f.buttons
     end

filter :category
filter :nombre

end

class PublicoController < ApplicationController
  def about
  end

  def services
  end

  def contact_us
  end
  

  #form

  def index   
   @post=Post.new
    @posts=Post.find(:all, :limit => 15, :order=> 'created_at desc')   
    
  end
#  creacion del texfield :honeyput para seguridad contra robots
def create
  if params[:honeyput].present?
format.html { redirect_to root_path, :notice => ' Fuera de aqui  ' }
elsif @post.save
    respond_to do |format|     
        format.html { redirect_to root_path, :notice => ' El comentario se creo exitosamente' }
       end
    end
end

end

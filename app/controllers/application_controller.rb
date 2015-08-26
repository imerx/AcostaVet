class ApplicationController < ActionController::Base
  protect_from_forgery


    
  require 'footer.rb'
  # define this method in applicaton_controller.rb
  
  def check_user_role  	  
    redirect_to root_path unless current_user.roles.first.name == "empleado" or current_user.roles.first.name == "supervisor"or current_user.roles.first.name == "admin" 
  end

  

  
end

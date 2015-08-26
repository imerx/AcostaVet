ActiveAdmin.register User do

menu :parent => "Administrar"
 #menu :label => " Usuarios"
### just temporary  index show remove actions  when dont need it
  actions :index, :show

	index do
      column :username
	    column :email
	    column "Role" do |user|
	      user.roles.map { |p| p.name }.join(' ')
	    end
	    column "Created at", :created_at
	    default_actions
  	end

  	form do |f|
  		f.inputs "User Details" do
          #f.input  :client_id#,:as => :hidden,  :required => true, :input_html => { :value => params['client_id'] },disabled: true, hint: 'You cannot change your id.'
          f.input :username
          f.input :email
          f.input :password
          f.input :password_confirmation
          f.input :roles # don't forget this one!
        end

        f.buttons
    end    

    show do |details|
      attributes_table do
        #row :client_id
        row :username
        row :email
        row "Role" do |role|
        	user.roles.map {|p| p.name}.join('')
        end
      end
      active_admin_comments
    end
  
filter :email

end

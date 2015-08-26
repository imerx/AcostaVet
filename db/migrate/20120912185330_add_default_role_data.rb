class AddDefaultRoleData < ActiveRecord::Migration
  def change
  	# Associate default admin user to admin role
  	Role.create!(:name => 'admin')
  	role = Role.find_by_name "admin"

  	admin_user = User.find_by_email "admin@example.com"
  	admin_user.roles << role

  end
end

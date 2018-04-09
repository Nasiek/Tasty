class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
  		t.string :uname
  		t.string :fname
  		t.string :lname
  		t.string :city
  		t.string :email
  		t.string :password
  		end
	end
end

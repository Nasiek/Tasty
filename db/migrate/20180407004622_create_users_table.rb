class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
  		t.string :fname
  		t.string :lname
  		t.string :city
  		t.string :email
  		t.integer :password
  		end
	end
end

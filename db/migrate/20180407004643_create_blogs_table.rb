class CreateBlogsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :blogs do |b|
  		b.text :category
  		b.text :title
  		b.text :blogpost
  		b.integer :user_id
  		b.timestamps 
  end
end
end

class CreateBlogsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :blogs do |b|
  		b.text :blogpost
  end
end
end

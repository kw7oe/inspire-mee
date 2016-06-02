class AddInspiredCounttoImages < ActiveRecord::Migration
  def change
  	add_column :images, :inspired_count, :integer, :default => 0
  end
end

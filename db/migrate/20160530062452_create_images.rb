class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :link
      t.string :caption
      t.timestamps null: false
    end
  end
end

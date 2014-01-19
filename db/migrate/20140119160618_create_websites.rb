class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :sitenaam
      t.string :url
      t.integer :count
      t.integer :user_id
      t.string :categorie

      t.timestamps
    end
  end
end

class AddCategorieToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :categorie_id, :integer
  end
end

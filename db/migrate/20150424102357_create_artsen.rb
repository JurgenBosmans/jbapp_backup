class CreateArtsen < ActiveRecord::Migration
  def change
    create_table :artsen do |t|
      t.integer :user_id
      t.string :naam
      t.string :specialiteit
      t.text :beschrijving
      t.string :telefoon
      t.string :website

      t.timestamps
    end
  end
end

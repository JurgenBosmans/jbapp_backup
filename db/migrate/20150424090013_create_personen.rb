class CreatePersonen < ActiveRecord::Migration
  def change
    create_table :personen do |t|
      t.integer :user_id
      t.string :naam
      t.string :voornaam
      t.date :geboortedatum
      t.string :soort

      t.timestamps
    end
  end
end

class CreateRecepten < ActiveRecord::Migration
  def change
    create_table :recepten do |t|
      t.integer :user_id
      t.string :naam
      t.string :bron
      t.string :soort
      t.integer :bereidingstijd
      t.integer :moeilijkheidsgraad
      t.integer :personen
      t.text :werkwijze
      t.text :ingredient

      t.timestamps
    end
  end
end

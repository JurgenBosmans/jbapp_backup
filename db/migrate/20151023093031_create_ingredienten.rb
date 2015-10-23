class CreateIngredienten < ActiveRecord::Migration
  def change
    create_table :ingredienten do |t|
      t.string :naam
      t.belongs_to :recept, index: true

      t.timestamps
    end
  end
end

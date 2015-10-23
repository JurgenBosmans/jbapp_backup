class CreateWerkwijzen < ActiveRecord::Migration
  def change
    create_table :werkwijzen do |t|
      t.text :stap
      t.belongs_to :recept, index: true

      t.timestamps
    end
  end
end

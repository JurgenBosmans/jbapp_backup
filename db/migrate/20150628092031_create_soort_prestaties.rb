class CreateSoortPrestaties < ActiveRecord::Migration
  def change
    create_table :soort_prestaties do |t|
      t.integer :user_id
      t.string :soort
      t.string :soort_detail

      t.timestamps
    end
  end
end

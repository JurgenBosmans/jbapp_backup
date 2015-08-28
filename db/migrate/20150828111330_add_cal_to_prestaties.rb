class AddCalToPrestaties < ActiveRecord::Migration
  def change
    add_column :prestaties, :cal, :integer
    add_column :prestaties, :best_lap, :string
    add_column :prestaties, :avg_lap, :string
    add_column :prestaties, :meettoestel, :string
    add_column :prestaties, :afstand, :string
    add_column :prestaties, :gewicht, :string
  end
end

class CreateDossiers < ActiveRecord::Migration
  def change
    create_table :dossiers do |t|
		t.integer :user_id
      t.integer :persoon_id
      t.integer :arts_id
      t.string :instelling
      t.string :soort_opname
      t.date :datum_onderzoek
      t.date :datum_document
      t.string :soort_document
      t.string :eigen_referentie
      t.decimal :te_betalen
      t.string :betaald, :default => "Nee"
      t.string :ziekenkas_verzonden, :default => "Nee"
      t.decimal :ziekenkas_terug_bedrag
      t.string :verzekering_verzonden, :default => "Nee"
      t.decimal :verzekering_terug_bedrag
      t.text :beschrijving
      t.string :afgehandeld, :default => "Nee"
      t.text :resultaat
      t.string :medicatie

      t.timestamps
    end
  end
end

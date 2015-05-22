class Dossier < ActiveRecord::Base
	belongs_to :user
	belongs_to :persoon
	belongs_to :arts
	
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :persoon_id, :presence => {:message => 'Je moet een patiënt opgeven'}
	validates :arts_id, :presence => {:message => 'Je moet een arts opgeven'}
	validates :datum_onderzoek, :presence => {:message => 'Je moet een datum opgeven'}
	validates :instelling, :presence => {:message => 'Je moet een instelling opgeven'}
	validates :soort_opname, :presence => {:message => 'Je moet een opname opgeven'}
	
	INSTELLING = ["Ander","Huisarts","Ziekenhuis","Wachtdienst"]
	OPNAME= ["Ander","Bloedonderzoek","Dagopname","Opname","Raadpleging"]
	JANEE=["Ja","Nee"]
	FACT=["Factuur","Rekening"]
	VERZEKERING=["Ja","Nee","Niet nodig"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end

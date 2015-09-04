class Dossier < ActiveRecord::Base
	
  belongs_to :user
	belongs_to :persoon
	belongs_to :arts
	
  after_initialize :defaults
 
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :persoon_id, :presence => {:message => 'Je moet een patiënt opgeven'}
	validates :arts_id, :presence => {:message => 'Je moet een arts opgeven'}
	validates :datum_onderzoek, :presence => {:message => 'Je moet een datum opgeven'}
	validates :instelling, :presence => {:message => 'Je moet een instelling opgeven'}
	validates :soort_opname, :presence => {:message => 'Je moet een opname opgeven'}
	
  validates :te_betalen, :ziekenkas_terug_bedrag, :verzekering_terug_bedrag, numericality: {greater_than_or_equal_to: 0}
  
	INSTELLING = ["Ander","Huisarts","Ziekenhuis","Wachtdienst"]
	OPNAME= ["Ander","Bloedonderzoek","Dagopname","Opname","Raadpleging"]
	JANEE=["Ja","Nee"]
	FACT=["Factuur","Rekening"]
	VERZEKERING=["Ja","Nee","Niet nodig"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
  
 def defaults
    self.te_betalen = "0"
    self.ziekenkas_terug_bedrag = "0"
    self.verzekering_terug_bedrag="0"
 end
end

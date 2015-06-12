# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
    inflect.irregular 'categorie', 'categories'
	inflect.irregular 'notitie', 'notities'
	inflect.irregular 'aankoop', 'aankopen'
	inflect.irregular 'onderhoud', 'onderhouden'
	inflect.irregular 'meterstand', 'meterstanden'
	inflect.irregular 'arts', 'artsen'
	inflect.irregular 'persoon', 'personen'
	inflect.irregular 'dossier', 'dossiers'
	inflect.irregular 'recept', 'recepten'
	inflect.irregular 'tip', 'tips'
	inflect.irregular 'bereiding', 'bereidingen'
	inflect.irregular 'product', 'producten'
		 
#   inflect.uncountable %w( fish sheep )
 end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

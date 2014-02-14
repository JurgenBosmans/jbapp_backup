class AddLaatsteBezoekToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :laatste_bezoek, :datetime
  end
end

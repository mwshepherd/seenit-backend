class AddDetailsToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :longitude, :float
    add_column :countries, :latitude, :float
  end
end

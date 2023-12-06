class AddColumnsToSightings < ActiveRecord::Migration[7.0]
  def change
    add_column :sightings, :start_date, :date
    add_column :sightings, :end_date, :date
  end
end

class AddTotalAverageRatingToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :total_average, :integer, default: 0
  end
end

class AddColumnToVenue < ActiveRecord::Migration
  def change
    add_column(:venues, :played, :boolean)
  end
end

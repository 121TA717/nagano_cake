class AddGenreIdToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :genre_id, :integer
  end
end
class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.string :release_date
      t.string :movie_link
      t.string :img_link

      t.timestamps
    end
  end
end

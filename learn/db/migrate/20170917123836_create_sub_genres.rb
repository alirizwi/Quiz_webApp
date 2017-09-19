class CreateSubGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_genres do |t|
      t.string :subgenrename
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end

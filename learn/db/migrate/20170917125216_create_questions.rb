class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :quest
      t.string :opta
      t.string :optb
      t.string :optc
      t.string :optd
      t.string :ans
      t.references :sub_genre, foreign_key: true

      t.timestamps
    end
  end
end

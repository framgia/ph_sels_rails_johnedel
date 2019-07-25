class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :lesson, foreign_key: true
      t.references :word, foreign_key: true
      t.references :choice, foreign_key: true

      t.timestamps
    end
  end
end

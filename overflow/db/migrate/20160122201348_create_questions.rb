class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.integer :user_id, index: true, null: false
      t.integer :best_answer_id, index: true, null: false

      t.timestamps null: false
    end
  end
end

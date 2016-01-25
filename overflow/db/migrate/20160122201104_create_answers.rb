class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :question_id, index: true, null: false
      t.integer :user_id, index: true, null: false

      t.timestamps null: false
    end
  end
end

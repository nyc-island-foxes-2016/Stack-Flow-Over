class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer     :user_id, index: true, null: false
      t.integer     :vote_type, null: false
      t.references  :voteable, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end

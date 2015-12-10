class CreateLearningLogs < ActiveRecord::Migration
  def change
    create_table :learning_logs do |t|
      t.string :learned_word
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

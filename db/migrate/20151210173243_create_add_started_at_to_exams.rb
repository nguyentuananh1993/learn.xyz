class CreateAddStartedAtToExams < ActiveRecord::Migration
  def change
    add_column :exams, :finished, :boolean, default: false
    add_column :exams, :started, :boolean, default: false
    add_column :exams, :started_at, :datetime
    
  end
end

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :poll
      t.text :text
    end
    
    add_index :questions, :poll_id
  end
end

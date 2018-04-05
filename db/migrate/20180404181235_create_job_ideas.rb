class CreateJobIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :job_ideas do |t|
      t.references :idea, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end

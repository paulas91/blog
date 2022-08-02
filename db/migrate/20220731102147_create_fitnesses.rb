class CreateFitnesses < ActiveRecord::Migration[7.0]
  def change
    create_table :fitnesses do |t|
      t.text :sex
      t.string :weight
      t.string :growth

      t.timestamps
    end
  end
end

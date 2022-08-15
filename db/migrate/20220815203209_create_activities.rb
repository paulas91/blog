class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :activitable, null: false, polymorphic: true

      t.timestamps
    end
  end
end

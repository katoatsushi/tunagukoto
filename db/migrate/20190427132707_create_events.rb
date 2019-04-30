class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :company_name
      t.datetime :event_time
      t.string :event_place
      t.string :event_cost
      t.string :event_type
      t.string :event_belongings
      t.text :event_detail
      # t.integer :user_id
      t.integer :manager_id

      t.timestamps
    end
  end
end

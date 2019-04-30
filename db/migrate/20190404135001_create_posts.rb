class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_name
      t.string :post_place
      t.time :post_time
      t.text :attract
      t.text :detail
      t.string :contact
      t.string :user_id
      t.string :company_id
      t.timestamps
    end
  end
end

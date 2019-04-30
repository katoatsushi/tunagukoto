class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
		t.text :info_body 
		t.text :info_url
		t.string :info_header
      t.timestamps
    end
  end
end

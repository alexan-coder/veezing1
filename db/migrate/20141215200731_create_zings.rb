class CreateZings < ActiveRecord::Migration
  def change
  	 create_table :zings do |t|
      t.integer :user_id, null: false
      t.integer :video_id, null: false
      t.timestamps
    end
  end
end


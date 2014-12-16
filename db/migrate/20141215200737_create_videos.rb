class CreateVideos < ActiveRecord::Migration
  def change
  	 create_table :videos do |t|
      t.string :title, null: false
      t.text :desc, null: false 
      t.text :video_url, null: false
      t.timestamps
    end
  end
end

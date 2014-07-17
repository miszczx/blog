class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :autor
    	t.string :tresc
    	t.integer :user_id
    	t.integer :login_id
    	t.timestamps
    end
  end
end

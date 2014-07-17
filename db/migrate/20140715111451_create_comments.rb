class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :tresc
    	t.integer :user_id
    	t.integer :login_id
    	t.integer :post_id
    	t.timestamps
    end
  end
end

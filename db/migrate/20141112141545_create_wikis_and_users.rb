class CreateWikisAndUsers < ActiveRecord::Migration

  def change
  	create_table :collaborators, id:false do |t|
    	t.integer :user_id
    	t.integer :wiki_id
    	t.timestamps
    end


    add_index :collaborators, :user_id
    add_index :collaborators, :wiki_id
  end
end

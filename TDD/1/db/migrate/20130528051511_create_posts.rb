class CreatePosts < ActiveRecord::Migration
  
  def up
      create_table :posts do |t|
      t.string :title
      t.test :body
      t.timestamp
    end

  end
  
  def down
    drop_table :posts
  end
end

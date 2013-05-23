class AddAccountToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :account-it
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :account-it
    end
  end
end

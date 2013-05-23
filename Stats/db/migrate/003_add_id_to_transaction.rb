class AddIdToTransaction < ActiveRecord::Migration
  def self.up
    change_table :transactions do |t|
      t.integer :transaction_id
    end
  end

  def self.down
    change_table :transactions do |t|
      t.remove :transaction_id
    end
  end
end

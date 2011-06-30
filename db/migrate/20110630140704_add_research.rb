class AddResearch < ActiveRecord::Migration
  def self.up
    add_column :products, :research, :string
  end

  def self.down
    remove_column :products, :research
  end
end

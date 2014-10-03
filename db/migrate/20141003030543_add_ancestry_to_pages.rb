class AddAncestryToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :ancestry, :string
    add_index :pages, :ancestry
  end

  def self.up
    add_column :pages, :ancestry, :string
    add_index :pages, :ancestry
  end
end

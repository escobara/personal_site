class AddPublishedToPage < ActiveRecord::Migration
  def change
    add_column :pages, :is_published, :boolean, default: 0
    add_column :pages, :pubdate, :datetime
  end
end

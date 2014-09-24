class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :page_type
      t.string :keywords
      t.text :description

      t.timestamps
    end
  end
end

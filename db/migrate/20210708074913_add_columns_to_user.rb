class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :profile, :text, default: ""
    add_column :users, :blog_url, :text, default: ""
  end
end

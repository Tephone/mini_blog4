class AddNullFalseToUSerColumns < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :profile, false
    change_column_null :users, :blog_url, false
  end
end

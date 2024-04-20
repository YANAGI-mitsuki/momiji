class AddNameToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :name, :string
  end
end

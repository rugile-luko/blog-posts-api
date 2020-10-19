class RemoveCreatedByFieldFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :created_by, :string
  end
end

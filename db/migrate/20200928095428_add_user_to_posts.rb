class AddUserToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :created_by, :string
  end
end

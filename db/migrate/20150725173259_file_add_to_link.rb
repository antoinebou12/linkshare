class FileAddToLink < ActiveRecord::Migration
  def change
    add_column :links, :file, :string
  end
end

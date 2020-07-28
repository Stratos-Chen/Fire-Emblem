class AddNameToBuilds < ActiveRecord::Migration[6.0]
  def change
    add_column :builds, :name, :string
  end
end

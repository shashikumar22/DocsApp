class RemoveNameFromDoctors < ActiveRecord::Migration[5.1]
  def change
    remove_column :doctors, :name, :string
  end
end

class AddTypeToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :type, :string
  end
end

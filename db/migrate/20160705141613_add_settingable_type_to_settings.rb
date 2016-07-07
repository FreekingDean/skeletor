class AddSettingableTypeToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :settingable_type, :string
  end
end

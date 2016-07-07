class AddMetaToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :metadata, :jsonb, default: {}, null: false
  end
end

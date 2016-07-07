class CreateSkeletons < ActiveRecord::Migration[5.0]
  def change
    create_table :skeletons do |t|
      t.string :name
      t.string :slug
      t.integer :account_id

      t.timestamps
    end
  end
end

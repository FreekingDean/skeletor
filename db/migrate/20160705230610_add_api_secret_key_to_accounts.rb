class AddApiSecretKeyToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :api_secret, :string
  end
end

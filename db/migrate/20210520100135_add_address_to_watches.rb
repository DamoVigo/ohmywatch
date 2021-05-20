class AddAddressToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :address, :string
  end
end

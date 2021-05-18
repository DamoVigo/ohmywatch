class AddStatusToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :status, :integer
  end
end

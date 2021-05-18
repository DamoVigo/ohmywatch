class AddDetailsToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :model, :string
    add_column :watches, :description, :text
    add_column :watches, :price, :integer
    add_reference :watches, :user, foreign_key: true
  end
end

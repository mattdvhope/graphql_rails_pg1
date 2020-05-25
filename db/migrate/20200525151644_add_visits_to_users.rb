class AddVisitsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :visits, :integer, default: 1
  end
end

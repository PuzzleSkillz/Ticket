class AddemailToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :login, :string, default: "", null: false
  end
end

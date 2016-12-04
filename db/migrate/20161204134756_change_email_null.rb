class ChangeemailNull < ActiveRecord::Migration[5.0]
  def change
  	change_column_null :users, :email, :string, default: "", null: true
  end
end

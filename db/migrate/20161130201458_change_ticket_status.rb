class ChangeTicketStatus < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tickets, :status, :string
  	add_column 	  :tickets, :status, :string, default: " Рассмотрение "
  end
end

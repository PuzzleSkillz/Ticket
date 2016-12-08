class TicketStatusDefault < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:tickets, :status, 'Новая')
  end
end

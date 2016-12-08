class AddTicketForComment < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :ticket_id, :integer
  end
end

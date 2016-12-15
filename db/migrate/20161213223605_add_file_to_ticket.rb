class AddFileToTicket < ActiveRecord::Migration[5.0]
  def up
    add_attachment :tickets, :file
  end

  def down
    remove_attachment :tickets, :file
  end
end

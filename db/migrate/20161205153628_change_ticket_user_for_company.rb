class ChangeTicketUserForCompany < ActiveRecord::Migration[5.0]
  def change
  	add_column :tickets, :company_name, :string
  end
end

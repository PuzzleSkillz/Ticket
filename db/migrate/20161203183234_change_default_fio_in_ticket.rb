class ChangeDefaultFioInTicket < ActiveRecord::Migration[5.0]
  def up
  	change_table :tickets do |t|
  	  t.change :admin_fio, :string ,default:"Ожидается"
  	end
  end
end

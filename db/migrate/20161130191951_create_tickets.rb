class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|

      t.string  :title
      t.text    :content
      t.string  :status
      t.string  :admin_fio
      t.integer :user_id

      t.timestamps
    end
  end
end

class AddDatesToTransfer < ActiveRecord::Migration[5.2]
  def change
    add_column  :transfers, :start_date, :date
    add_column  :transfers,:end_date, :date

  end
end

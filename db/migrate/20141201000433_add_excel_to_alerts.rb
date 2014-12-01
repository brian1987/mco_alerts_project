class AddExcelToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :excel, :string
  end
end

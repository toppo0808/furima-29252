class RenameDateIdColumnToSendingDateId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :date_id, :sending_date_id
  end
end

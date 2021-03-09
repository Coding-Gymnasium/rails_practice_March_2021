class AddCohortIdToTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column  :transfers, :cohort_id, :integer
  end
end

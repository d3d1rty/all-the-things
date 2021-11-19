class RemovedPawnedFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :pawned
  end
end

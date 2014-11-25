class RemoveEventIdToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :event_id
  end
end

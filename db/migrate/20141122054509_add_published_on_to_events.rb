class AddPublishedOnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :published_on, :date
  end
end

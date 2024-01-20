class RemoveOptionIdFromResponses < ActiveRecord::Migration[7.0]
  def change
    remove_column :responses, :option_id

  end
end

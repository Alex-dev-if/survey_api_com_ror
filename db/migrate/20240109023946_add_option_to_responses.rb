class AddOptionToResponses < ActiveRecord::Migration[7.0]
  def change
    add_reference :responses, :option, null: false, foreign_key: true
  end
end

class AddForeignKeyParaResponses < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :responses, :questions
    add_foreign_key :responses, :questions, on_delete: :cascade
  end
end

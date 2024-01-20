class AddForeignKeyParaQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :questions, :surveys
    add_foreign_key :questions, :surveys, on_delete: :cascade
  end
end

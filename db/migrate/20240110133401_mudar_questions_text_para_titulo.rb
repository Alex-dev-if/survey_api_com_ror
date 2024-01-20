class MudarQuestionsTextParaTitulo < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :text, :titulo
  end
end

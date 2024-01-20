class VoltarParaText < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :titulo, :text
  end
end

class AddOptionsToQuestions3 < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :options, :text

  end
end

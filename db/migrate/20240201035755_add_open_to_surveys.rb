class AddOpenToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :open, :boolean

  end
end

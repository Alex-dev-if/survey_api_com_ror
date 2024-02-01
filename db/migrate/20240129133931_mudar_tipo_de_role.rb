class MudarTipoDeRole < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, 'integer using cast(role as integer)'

  end
end

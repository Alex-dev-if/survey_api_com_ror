class MudarContentParaJsonb < ActiveRecord::Migration[7.0]
  def up
    change_column :responses, :content, 'jsonb USING CAST(content AS jsonb)'
  end

  def down
    change_column :responses, :content, 'character varying USING CAST(content AS character varying)'
  end
end

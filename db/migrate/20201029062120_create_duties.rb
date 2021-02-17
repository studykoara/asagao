class CreateDuties < ActiveRecord::Migration[5.2]
  def change
    create_table :duties do |t|
      t.references :member, null: true     # 外部キー
      t.string :duty                       # 担当係

      t.timestamps
    end
  end
end

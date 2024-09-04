class CreateImcs < ActiveRecord::Migration[6.1]
  def change
    create_table :imcs, id: :uuid do |t|
      t.decimal :value
      t.string :message
      t.string :obesity_degree
      t.references :client, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

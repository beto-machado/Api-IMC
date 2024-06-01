class CreateImc < ActiveRecord::Migration[6.1]
  def change
    create_table :imcs, id: :uuid do |t|
      t.decimal :imc_value
      t.string :message
      t.decimal :height
      t.decimal :weight
      t.string :obesity

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :titulo, null: false
      t.text :descricao
      t.boolean :concluida, default: false
      t.integer :prioridade, default: 1
      t.datetime :data_vencimento
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

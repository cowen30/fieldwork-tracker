class CreateEmphasisTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :emphasis_types do |t|
      t.string :name
      t.integer :display_order

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end

    add_foreign_key :emphasis_types, :users, column: :created_by
    add_foreign_key :emphasis_types, :users, column: :updated_by
  end
end

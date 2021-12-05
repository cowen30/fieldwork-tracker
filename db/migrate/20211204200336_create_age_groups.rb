class CreateAgeGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :age_groups do |t|
      t.string :name
      t.integer :display_order

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end

    add_foreign_key :age_groups, :users, column: :created_by
    add_foreign_key :age_groups, :users, column: :updated_by
  end
end

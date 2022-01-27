class CreateLocations < ActiveRecord::Migration[6.1]
	def change
		create_table :locations do |t|
			t.string :name
			t.integer :user_id
			t.integer :emphasis_type_id
			t.integer :area_type_id
			t.integer :age_group_id

			t.integer :created_by
			t.integer :updated_by
			t.timestamps
		end

		add_foreign_key :locations, :users
		add_foreign_key :locations, :emphasis_types
		add_foreign_key :locations, :area_types
		add_foreign_key :locations, :age_groups

		add_foreign_key :locations, :users, column: :created_by
		add_foreign_key :locations, :users, column: :updated_by
	end
end

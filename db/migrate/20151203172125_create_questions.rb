class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :title
			t.string :body
			t.timestamps null: false

			t.belongs_to :user
		end
	end
end

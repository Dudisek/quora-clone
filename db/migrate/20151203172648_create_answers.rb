class CreateAnswers < ActiveRecord::Migration
	def change
			create_table :answers do |t|
			t.string :answer
			t.timestamps null: false

			# t.belongs_to :user
		end 
	end
end

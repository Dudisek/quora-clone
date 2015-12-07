class CreateQvotes < ActiveRecord::Migration
	def change
		create_table :qvotes do |t|
			t.integer :upvote
			t.integer :downvote

			t.belongs_to :question
			t.belongs_to :user
		end
	end
end


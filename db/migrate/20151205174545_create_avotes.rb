class CreateAvotes < ActiveRecord::Migration
	def change
	create_table :avotes do |t|
		t.integer :upvote
		t.integer :downvote

		t.belongs_to :answer
	end
	end
end
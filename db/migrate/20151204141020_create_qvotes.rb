class CreateQvotes < ActiveRecord::Migration
	def change
		create_table :qvotes do |t|
			t.integer :upvote
			t.integer :downvote

			t.belongs_to :question
		end
	end
end



# class CreateAnswers < ActiveRecord::Migration
# 	def change
# 			create_table :answers do |t|
# 			t.string :comment
# 			t.timestamps null: false

# 			t.belongs_to :user
# 			t.belongs_to :question
# 		end 
# 	end
# end

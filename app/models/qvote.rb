class Qvote < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	# validates_uniqueness_of :question_id, :scope => [:upvote, :downvote]
	# validates_uniqueness_of :question_id, :scope => [ where(upvote: 1) && (downvote: 1)]
	# validates_uniqueness_of :question_id, :scope => [:upvote] || [:downvote]
	# scope :published, -> { where(published: true) }
	# validates_uniqueness_of :question_id, conditions: -> { where.not(upvote: 1)  ||  where.not(downvote: 1) }
end

# SEED USERS
# 200.times do
# User.create(name: Faker::Internet.user_name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456", description: Faker::Lorem.paragraph )
# end


# SEED QUESTION
# 100.times do
# Question.create(title: Faker::Book.title, body: Faker::Lorem.paragraph, user_id: Faker::Number.between(1, 100),)
# end

# SEED ANSWER

# 100.times do
# Answer.create(comment: Faker::Lorem.paragraph, user_id: Faker::Number.between(1, 200), question_id: Faker::Number.between(1, 100))
# end

# SEED QVOTES

200.times do
Qvote.create(upvote: Faker::Number.between(0, 1), downvote: Faker::Number.between(0, 1), question_id: Faker::Number.between(1, 100))
end

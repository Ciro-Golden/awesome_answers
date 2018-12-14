# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# to run you seeds, do: 
# rails db:seed
Answer.destroy_all
Question.destroy_all
users = User.all


User.destroy_all

    PASSWORD = "supersecret"

    super_user = User.create(
        first_name: "Jon",
        last_name: "Snow",
        email: "js@winterfell.gov",
        password: PASSWORD,
        admin: true
    )

    10.times do
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        User.create(
          first_name: first_name,
          last_name: last_name,
          email: "#{first_name.downcase}-#{last_name.downcase}@example.com",
          password: PASSWORD
        )
      end


200.times do
    created_at = Faker::Date.backward(365 * 5)
    q = Question.create(
        # Faker is a ruby module, we access classes or other module 
        # inside of module with ::. Here Hacker is a class inside of the 
        # Faker module.
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        view_count: rand(100_000),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if q.valid?
        rand(0...15).times do
            q.answers << Answer.new(
                body: Faker::GreekPhilosophers.quote,
                user: users.sample
            )
        end
    end
end

question = Question.all
answers = Answer.all


puts Cowsay.say("Generated #{question.count} questions", :frogs)
puts Cowsay.say("Generated #{answers.count} answers", :sheep)
puts Cowsay.say("Generated #{users.count} answers", :dragon)
puts Cowsay.say("Login with #{super_user.email} and password: #{PASSWORD}", :ghostbusters)

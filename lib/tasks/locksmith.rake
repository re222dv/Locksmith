namespace :locksmith do
  desc 'Fill database with sample data'
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke


    anna = Locksmith::User.create(
        name: 'Anna',
        email: 'basic@user.com',
        password: 'password',
    )
    Locksmith::Application.create(
        name: 'Marwhal',
        user: anna
    )
    Locksmith::Application.create(
        name: 'Marlin',
        user: anna
    )

    edwin = Locksmith::User.create(
        name: 'Edwin',
        email: 'admin@user.com',
        password: 'password',
        admin: true,
    )
    Locksmith::Application.create(
        name: 'Elephant',
        user: edwin
    )
    Locksmith::Application.create(
        name: 'Giraffe',
        user: edwin
    )

    (rand(20) + 10).times do
      user = Locksmith::User.create(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: Faker::Internet.password,
      )

      rand(5).times do
        Locksmith::Application.create(
            name: Faker::Company.name,
            user: user
        )
      end
    end
  end
end

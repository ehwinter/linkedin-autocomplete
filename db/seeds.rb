
#Random Users
(1..50).each do |i|
  # use placehold.it so the "picture" is a random color.
  user = Person.create! :name => Faker::Name.name, :email => Faker::Internet.email, :company => Faker::Company.name, :picture => Random.rand(0..(0xfff)-1)
end

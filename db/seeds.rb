User.create!(name:  "admin",
  email: "admin@framgia.com",
  avatar: Settings.users.avatar_nil,
  password: "$2a$11$gHWhyOjpXvNJWzqKnwbdTesD87G0MSZV8UH0FRKeByvEz5xjIwSfC"
)

10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  avatar = Settings.users.avatar_nil
  encrypted_password = "$2a$11$gHWhyOjpXvNJWzqKnwbdTesD87G0MSZV8UH0FRKeByvEz5xjIwSfC"
  User.create!(name: name,
    email: email,
    avatar: avatar,
    password: encrypted_password
  )
end

5.times do |n|
  Category.create!(
    name: "Category#{n+1}",
    description: "Cras purus odio, vestibulum in vulputate at, tempus viverra turpis",
  )
end

10.times do |n|
  title = Faker::Book.title;
  Post.create!(
    title: title,
    content: "Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.",
    slug: title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, ''),
    user_id: User.order("RAND()").first.id,
    category_id: Category.order("RAND()").first.id
  )
end

50.times do |n|
  Comment.create!(
    content: "Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.",
    user_id: User.order("RAND()").first.id,
    post_id: Post.order("RAND()").first.id
  )
end

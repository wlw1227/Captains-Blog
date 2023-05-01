require 'faker'
require 'cicero'

# Create categories
Category.create(name: 'Official')
Category.create(name: 'Supplemental')

# Create users with last name as username
captains = ['Kirk', 'Picard', 'Sisko', 'Janeway', 'Archer', 'Georgiou', 'Pike', 'Burnham', 'Saru', 'La Forge']
captains.each do |name|
  User.create(username: name, email: Faker::Internet.email(name: "#{name}"), password: 'password')
end

# Create articles for each user
User.all.each do |user|
  10.times do
    # Randomly select a category
    category = Category.all.sample

    # Generate a random stardate
    stardate = Faker::Number.between(from: 1000, to: 9999)

    # Create a new article with random content
    article = user.articles.create(
      title: Faker::TvShows::StarTrek.location,
      body: Cicero.paragraphs(2),
      stardate: stardate
    )

    # Add comments from other captains
    5.times do
      # Randomly select a user that is not the author of the article
      commenter = User.where.not(id: user.id).sample

      # Add a comment to the article with random content
      article.comments.create(
        body: Cicero.sentences(3),
        user_id: commenter.id
      )
    end
  end
end
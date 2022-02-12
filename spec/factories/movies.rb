FactoryBot.define do
  factory :movie do
    title {"olympic"}
    content {"df';lgjdfg;kldfgj"}
    association :category, factory: :category_fantasy
    slug {"olympic"}
    # category { }
    # video {"df';lgjdfg;kldfgj"}
    after(:build) do |movie|
      movie.video.attach(io: File.open('spec/fixtures/test_video.webm'), filename: 'test_video.webm', content_type: 'video/webm')
    end
  end

  factory :movie_blockbuster,parent: :movie do
    title {"category_blockbuster"}
    association :category, factory: :category_blockbuster
    slug {"movie_blockbuster"}
  end

  factory :movie_romantic,parent: :movie do
    title {"movie_romantic"}
    association :category, factory: :category_romantic
    slug {"movie_romantic"}
  end

  factory :movie_romantic_other,parent: :movie do
    title {"movie_romantic other"}
    association :category, factory: :category_romantic
    slug {"movie_romantic other"}
  end

  factory :movie_blockbuster_other,parent: :movie do
    title {"category blockbuster other"}
    association :category, factory: :category_blockbuster
    slug {"movie_blockbuster_other"}
  end

end

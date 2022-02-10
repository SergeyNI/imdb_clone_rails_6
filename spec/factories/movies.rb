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
end

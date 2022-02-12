FactoryBot.define do
  factory :category do
    name {""}
  end
  factory :category_fantasy, parent: :category do
    name {"fantasy"}
  end

  factory :category_blockbuster, parent: :category do
    name {"blockbuster"}
  end

  factory :category_romantic, parent: :category do
    name {"romantic"}
  end
end

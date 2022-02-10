FactoryBot.define do
  factory :category do
    name {""}
  end
  factory :category_fantasy, parent: :category do
    name {"fantasy"}
  end
end

FactoryBot.define do
  factory :admin_user, class: 'AdminUser' do
    email {'admin@example.com'}
    password {'qwerty123456'}
  end
end

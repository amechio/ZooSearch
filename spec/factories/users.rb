FactoryBot.define do
  factory :user do
    name { 'テストユーザ1' }
    email { 'test1@mail.com' }
    password { 'password1' }
    password_confirmation { 'password1' }
    admin { 'true' }
  end
  factory :user2, class: User do
    name { 'テストユーザ2' }
    email { 'test2@mail.com' }
    password { 'password2' }
    password_confirmation { 'password2' }
    admin { 'false' }
  end
  factory :user3, class: User do
    name { 'テストユーザ3' }
    email { 'test3@mail.com' }
    password { 'password3' }
    password_confirmation { 'password3' }
    admin { 'false' }
  end
end

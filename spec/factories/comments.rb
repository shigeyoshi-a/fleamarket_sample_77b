FactoryBot.define do
  factory :comment do
    comment { "MyString" }
    user { nil }
    item { nil }
  end
end

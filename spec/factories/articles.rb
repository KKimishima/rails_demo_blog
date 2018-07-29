FactoryBot.define do
  factory :article do
    sequence(:content) { |n| "TEST_CONTENT#{n}"}
    sequence(:title) { |n| "TEST_CONTENT#{n}"}

  end
end


FactoryBot.define do
    factory :article do
        title { Faker::Lorem.sentence(word_count: 2) }
        description { Faker::Lorem.paragraph(sentence_count: 3) }
        association :user
    end
end

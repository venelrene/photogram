FactoryBot.define do
  factory :notification do
    user nil
    post nil
    read false
    subscribed_user nil
    identifier 1
    type ""
  end
end

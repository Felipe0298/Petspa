FactoryBot.define do
  factory :appoinment_type do
    payment_required { false }
    name { "MyString" }
    user { nil }
    price { 1 }
    description { nil }
  end
end

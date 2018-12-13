FactoryBot.define do
  factory :school, class: School do
    name { "West High" }
    address { "500 west" }
    principal { "Bob Bobson" }
    capacity { 1000 }
  end
end
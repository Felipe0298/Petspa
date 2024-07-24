User.destroy_all
AppoinmentType.destroy_all
City.destroy_all
Local.destroy_all

user = User.create!(
  first_name: "Tester", last_name: "Testino potencial",
  username: 'tester1', email: 'tester1@test.com',
  phone: '123456789', password: '123456', role: 2
)

user2 = User.create!(
  first_name: "Tester2", last_name: "Testino potencial",
  username: 'tester2', email: 'tester2@test.com',
  phone: '1234567779', password: '123456', role: 0
)

pet1 = Pet.create!(
  name: "Firulais", breed: "Poodle",
  important_data: "Muerde a veces", user: user2,
  kind: 0
)

city1 = City.create!(name: "Lima")
city2 = City.create!(name: "Arequipa")
city3 = City.create!(name: "Trujillo")
city4 = City.create!(name: "Cusco")
city5 = City.create!(name: "Cajamarca")

local1 = Local.create!(
  address: "Av. Los Pinos 123",
  city: city1
)

local2 = Local.create!(
  address: "Av. Los Aranandanos 123",
  city: city2
)

local3 = Local.create!(
  address: "Av. Pizarro 123",
  city: city3
)

appoinment_type1 = AppoinmentType.create!(
  name: "Baño", payment_required: true,
  user: user, price: 100, color: "#38bdf8"
)

appoinment_type2 = AppoinmentType.create!(
  name: "Baño y corte", payment_required: true,
  user: user, price: 180, color: "#fbbf24"
)

appoinment_type3 = AppoinmentType.create!(
  name: "Session spa premium", payment_required: true,
  user: user, price: 250, color: "#34d399"
)

15.times do |t|
  appoinment = Appoinment.create!(
    start_at: DateTime.now + t.day,
    end_at: DateTime.now + t.day + 1.hour,
    pet: pet1, client: user2,
    appoinment_type: appoinment_type1,
    status: 0, local: local1
  )
  payment = Payment.create!(
    appoinment: appoinment,
    user: user2 
  )
  payment.receipt.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'receipt_image.jpg')
end

20.times do |t|
  appoinment = Appoinment.create!(
    start_at: DateTime.now + t.day,
    end_at: DateTime.now + t.day + 1.hour,
    pet: pet1, client: user2,
    appoinment_type: appoinment_type1,
    status: 0, local: local2
  )
  payment = Payment.create!(
    appoinment: appoinment,
    user: user2 
  )
  payment.receipt.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'receipt_image.jpg')
end

25.times do |t|
  appoinment = Appoinment.create!(
    start_at: DateTime.now + t.day,
    end_at: DateTime.now + t.day + 1.hour,
    pet: pet1, client: user2,
    appoinment_type: appoinment_type1,
    status: 0, local: local3
  )
  payment = Payment.create!(
    appoinment: appoinment,
    user: user2 
  )
  payment.receipt.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'receipt_image.jpg')
end

puts "Seed finished"
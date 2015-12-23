1.times do 
  user = User.new(
    name:   "Kevin",
    email:  "kkornafel82@yahoo.com",
    password: "Terrapin11",
    role: "premium"
    )

  user.skip_confirmation!
  user.save!
end

1.times do
admin = User.new(
  name:     'Admin',
  email:    'admin@example.com',
  password: 'helloworld',
  role: 'standard'
)
admin.skip_confirmation!
admin.save!
end

1.times do
member = User.new(
  name:     'Member',
  email:    'member@example.com',
  password: 'helloworld',
  role: "standard"
)
member.skip_confirmation!
member.save!
end


1.times do 
  item = Business.create!(
  user:  User.first,
  name:  "Sample Business",
  trade: "Sample Trade",
  address: "123 Fake Street Faketown, PA 12345"
  )
end

puts "Seed finished"
puts "#{Business.count} Businesses created"
# 2 regular user accounts
user1_info = {
  email: 'user1@user.com',
  password: 'user1pass'
}
user1 = User.create(user1_info)

user2_info = {
  email: 'user2@user.com',
  password: 'user2pass'
}
user2 = User.create(user2_info)

# 2 cards
card1_info = {
  card_no: '4242424242424242',
  cvv: '424',
  card_type: 'Visa',
  user: user1
}
card1 = Card.create(card1_info)

card2_info = {
  card_no: '5555555555554444',
  cvv: '555',
  card_type: 'Mastercard',
  user: user2
}
card2 = Card.create(card2_info)

# 1 superadmin account
admin1_info = {
  email: 'admin1@admin.com',
  password: 'admin1pass',
  admin: true
}
admin1 = User.create(admin1_info)

# 2 stalls
stall1_info = {
  name: 'Chicken Rice',
  halal: true
}
stall1 = Stall.create(stall1_info)

stall2_info = {
  name: 'Ban Mian',
  halal: false
}
stall2 = Stall.create(stall2_info)

# 2 staff (owner) accounts
owner1_info = {
  email: 'owner1@staff.com',
  password: 'owner1pass',
  role: 'owner',
  stall: stall1
}
owner1 = Staff.create(owner1_info)

owner2_info = {
  email: 'owner2@staff.com',
  password: 'owner2pass',
  role: 'owner',
  stall: stall2
}
owner2 = Staff.create(owner2_info)

# 2 staff (employee) accounts
employee1_info = {
  email: 'employee1@staff.com',
  password: 'employee1pass',
  role: 'employee',
  stall: stall1
}
employee1 = Staff.create(employee1_info)

employee2_info = {
  email: 'employee2@staff.com',
  password: 'employee2pass',
  role: 'employee',
  stall: stall2
}
employee2 = Staff.create(employee2_info)

# 3 menu_items
menu_item1_info = {
  name: 'Roasted Chicken Rice',
  price: 2.50,
  waiting_time: 5,
  stall: stall1
}
menu_item1 = MenuItem.create(menu_item1_info)

menu_item2_info = {
  name: 'Steamed Chicken Rice',
  price: 2.50,
  waiting_time: 5,
  stall: stall1
}
menu_item2 = MenuItem.create(menu_item2_info)

menu_item3_info = {
  name: 'Ban Mian',
  price: 2.50,
  waiting_time: 10,
  stall: stall2
}
menu_item3 = MenuItem.create(menu_item3_info)

# order_items for 3 payments, for 3 orders
payment1 = Payment.create(amt: 5.0, card: card1)
order1 = Order.create(payment: payment1, user: user1)
order_item1 = OrderItem.create(qty: 1, menu_item: menu_item1, order: order1)
order_item2 = OrderItem.create(qty: 1, menu_item: menu_item2, order: order1)

payment2 = Payment.create(amt: 2.5, card: card1)
order2 = Order.create(payment: payment2, user: user1)
order_item3 = OrderItem.create(qty: 1, menu_item: menu_item3, order: order2)

payment3 = Payment.create(amt: 5.0, card: card2)
order3 = Order.create(payment: payment3, user: user2)
order_item4 = OrderItem.create(qty: 1, menu_item: menu_item1, order: order3)
order_item5 = OrderItem.create(qty: 1, menu_item: menu_item3, order: order3)

puts "lookin' good! check out ur newly swagged out database :~)"

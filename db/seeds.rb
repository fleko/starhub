ActiveRecord::Base.transaction do

  # First, empty the DB
  Review.destroy_all
  Issue.destroy_all
  Product.destroy_all
  Customer.destroy_all

  # Customers
  fred = Customer.create(first_name: 'fred', last_name: 'heath', username: 'freddo', email: 'fred@gmail.com', password: 'babushka')
  ben = Customer.create(first_name: 'ben', last_name: 'smith', username: 'batman', email: 'ben@gmail.com', password: 'babushka')
  jerry = Customer.create(first_name: 'jerry', last_name: 'jones', username: 'bsm776', email: 'jerry@gmail.com', password: 'babushka')

  # Products
  wolfen = Product.create(name: 'Wolfenstein', code: 'WLFN', category: 'SHOOTER')
  zombies = Product.create(name: 'Age Of Zombies', code: 'AOZM', category: 'RPG')
  larry = Product.create(name: 'Laounge Larry 2106', code: 'LL16', category: 'ARCADE')

  # reviews
  Review.create(customer: fred, product: zombies, rating: 4, comment: 'that was a scary experience')
  Review.create(customer: fred, product: larry, rating: 5, comment: 'back in the 80s dude!')
  Review.create(customer: jerry, product: larry, rating: 3, comment: 'Not as sleek as I remember')

  # Issues
  Issue.create(customer: ben, product: larry, severity: 'COSMETIC', comment: 'pixelation at the top corner of the screen')
  Issue.create(customer: jerry, product: larry, severity: 'MINOR', comment: 'Jerry cannot open door at level 2')

end

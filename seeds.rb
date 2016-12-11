require_relative( 'models/tickets' )
require_relative( 'models/films' )
require_relative( 'models/customers' )

require('pry')

customer1 = Customer.new({ 'name' => 'Steven' , 'funds' => 2
  })
customer1.save()

customer2 = Customer.new ({ 'name' => 'Rory' , 'funds' => 30
  })
customer2.save()

film1 = Film.new({ 'title' => 'star wars' , 'price' => 15
  })
film1.save()

film2 = Film.new ({ 'title' => 'the fifth element' , 'price' => 10
  })
film2.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id
  })
ticket1.save()


binding.pry
nil
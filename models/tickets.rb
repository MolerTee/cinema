require_relative("../db/sql_runner")

class Ticket
  
  def initialize( options )
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (title , prices)
           VALUES ('#{ @title }', #{ @price }) RETURNING id"
    ticket = SqlRunner.run( sql ).first
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    return Ticket.get_many( sql )
  end

  def self.delete_all() 
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.get_many ( sql )
    tickets = SqlRunner.run( sql )
    ticket_objects = tickets.map {  |ticket| Ticket.new( ticket ) }
    return ticket_objects
  end

end
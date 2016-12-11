require_relative("../db/sql_runner")

class Customer
  
  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end


  def save()
    sql = "INSERT INTO customers (name , funds)
           VALUES ('#{ @name }', #{ @funds }) RETURNING id"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    return Customer.get_many( sql )
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.get_many ( sql )
    customers = SqlRunner.run( sql )
    customer_objects = customers.map {  |customer| Customer.new( customer ) }
    return customer_objects
  end

  def update_customer()
    sql = "UPDATE customers SET (name) = '#{ name}' WHERE id = #{@id}; "
    SqlRunner.run(sql)

  end
end
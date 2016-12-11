require_relative("../db/sql_runner")

class Film

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title , prices)
           VALUES ('#{ @title }', #{ @price }) RETURNING id"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    return Film.get_many( sql )
  end

  def self.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.get_many ( sql )
    films = SqlRunner.run( sql )
    film_objects = films.map {  |film| Film.new( film ) }
    return film_objects
  end

  def update_film()
    sql = "UPDATE films SET (title) = '#{ title}' WHERE id = #{@id}; "
    SqlRunner.run(sql)

  end

end
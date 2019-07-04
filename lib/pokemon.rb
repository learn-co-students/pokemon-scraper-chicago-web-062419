class Pokemon

    attr_accessor :name, :type, :db, :id
    

    def initialize(name:, type:, db:, id:)
        @name = name
        @type = type
        @db = db
        @id = id
    end


    def self.save(name, type, db)
        sql = <<-SQL
      INSERT INTO pokemon(name, type)
      VALUES (?, ?)
      SQL

      db.execute(sql, name, type)
    
    end

    def self.find(id, db)
        name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
        type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]
        hash = {id: id, name: name, type: type, db: db}
        newPokemon = Pokemon.new(hash)

    end


end


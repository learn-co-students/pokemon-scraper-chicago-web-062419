class Pokemon

    attr_accessor :id, :name, :type
    attr_reader :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
        # binding.pry
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id_num, db)
        sql = "SELECT * FROM pokemon WHERE pokemon.id = ?"
        
        row = db.execute(sql, id_num).flatten
            # binding.pry
            self.new(id: row[0], name: row[1], type: row[2], db: db) 

    end


end


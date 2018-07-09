
class Person 
    attr_accessor :first_name, :last_name
    def initialize(fname, lname) 
        @first_name = fname
        @last_name = lname
    end

end

class Politician < Person
    attr_accessor :party, :first_name, :last_name
    @@politicians = []
    def initialize(fname,lname, party)
        super(fname, lname)
        @party = party
        @@politicians << {first_name: @first_name,
         last_name: @last_name, 
         party: @party
        }   
    end

    def self.politician_list 
        @@politicians
    end
end

class Voter < Person
    attr_accessor :party, :first_name, :last_name
    @@voters = []
    def initialize(fname,lname, id, affiliation)
        super(fname, lname)
        @id = id
        @affiliation = affiliation
        @@voters << {
         first_name: @first_name,
         last_name: @last_name, 
         id: @id,
         affiliation: @affiliation
        }   
    end

    def self.voter_list 
        @@voters
    end
end

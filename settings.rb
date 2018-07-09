require './people.rb'
require './traverse.rb'

def menu
    puts "\n\n\n\nWelcome to the Wyncode Election Simulation "
    puts "What would you like to do? [1-4]"
    puts "1. Create voter/politician" 
    puts "2. List all voters and politicians" 
    puts "3. Update voter/politician preferences" 
    puts "4. Delete voter/politician profile" 
    puts "5. Exit Simulation"
    print "..............."
    option = gets.chomp.to_i

    case option 
        when 1
           create_peron
        when 2
            list_election
        when 3
            update
        when 4
            update(1)
        when 5 
            exit 
        else
            puts "\n\n*********Input NOT Valid, Please try Again*********"
            menu
        end
    
end

def create_peron
    puts "Create (P)olitician or (V)oter: "
    type = gets.chomp.upcase!
    puts "Enter your FIRST legal name: "
    fname = gets.chomp
    puts "Enter your LAST legal name: "
    lname = gets.chomp
    if (type == 'P')
        puts "(D)emocrat or (R)epublican"
        party = gets.chomp.upcase!
        Politician.new(fname, lname, party)
    elsif (type == "V")
        puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
        aff = gets.chomp
        puts "Enter Your voter ID"
        id = gets.chomp.upcase!
        Voter.new(fname, lname, id, aff)
    else 
        raise "INVALID USER INPUT"
    end
    menu
end


def list_election
    puts "Voters: "
    Voter.voter_list.each{ |v|
        puts "Name: #{v[:first_name]} #{v[:last_name]}"
        puts "ID: #{v[:id]}"
        puts "Affiliation: #{v[:affiliation]}"
        puts "-----------"
    }
    puts "Politicians: "
    Politician.politician_list.each{ |v|
        puts "Name: #{v[:first_name]} #{v[:last_name]}"
        puts "Party: #{v[:party]}"
        puts "-----------"
    }
    menu
end
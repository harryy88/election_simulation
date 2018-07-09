

def update(work = 0)
    puts "Please enter your FIRST and LAST name? :)"
    change = gets.chomp.split(" ")
    found = false
    Voter.voter_list.each_with_index{ |v, i|
        if v[:first_name] == change[0] && v[:last_name]==change[1]
            found = true
            if (work==0);  update_voter(i) end
            if (work==1);  delete_voter(i) end
        end 
    }
    if (!found)
        Politician.politician_list.each_with_index{ |v, i|
            if v[:first_name] == change[0] && v[:last_name]==change[1]
                found = true
                if (work==0); update_politician(i) end
                if (work==1);  delete_politician(i) end
            end 
         }
    end
    if (!found)
        puts "\n\n\*********Profile NOT Found, Please Try Again Later*********\n\n\n"
        
        menu
    end
end

def update_voter(i)
    puts "What is your NEW party? (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    n_party = gets.chomp.upcase!
    Voter.voter_list[i][:affiliation] = n_party
    menu
end
def delete_voter(i)
    Voter.voter_list.delete_at(i)
    puts "Profile Deleted"
    menu
end
def delete_politician(i)
    Politician.politician_list.delete_at(i)
    puts "Profile Deleted"
    menu
end

def update_politician(i)
    puts "What is your NEW party? (D)emocrat or (R)epublican"
    n_party = gets.chomp.upcase!
    Politician.politician_list[i][:party] = n_party
    menu
end
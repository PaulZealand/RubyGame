predictor = ["CC0", "OC1", "CO1", "OO2",
             "CC1", "OC2", "CO2", "OO3",
             "CC2", "OC3", "CO3", "OO4"]
not_predictor = ["CO", "OC", "CC", "OO"]

x = [0, 1, 2, 3, 4]
game_won = false
pred = "you"

puts "Welcome to the game!\nYou are the predictor, what is your input?"

while game_won == false
    case pred
      when "you"
        answer = gets.chomp
        answer = answer.upcase
            if answer.length != 3
              puts "Your input must contain 3 symbols. Try 1 more time!"
            elsif not_predictor.to_s.include?(answer[0..-2].to_s) and x.to_s.include?(answer[-1].to_s)
              y = not_predictor.sample
              puts "\"AI\" answer is: #{y}!"
                      if answer.count("O") + y.count("O") == answer[-1].to_i
                        puts "Congratulations, you won!\nWould you like to play once again?"
                            yes_no = false
                            while yes_no == false
                              answer = gets.chomp
                              answer = answer.upcase
                              if answer == "YES"
                                puts "Welcome to the game!\nYou are the predictor, what is your input?"
                                pred = "you"
                                yes_no = true
                              elsif answer == "NO"
                                puts "Bye, bye!"
                                game_won = true
                                yes_no = true
                              else puts "Wrong input! You may insert only \"Yes\" or \"No\" answers!"
                            break if yes_no == true
                              end
                            end
                      else
                        puts "Your guess is wrong! Now \"AI\" is the predictor! What is your input?"
                        pred = "ai"
                      end
            else puts "1st and 2nd symbols must be \"O\" or \"C\" only! And 3rd symbol must be a digit between \"0-4\""
            end
      when "ai"
        answer = gets.chomp
        answer = answer.upcase
            if answer.length != 2
              puts "In this round you are not a predictor, so your input must contain only 2 symbols!"
            elsif not_predictor.to_s.include?(answer.to_s)
              z = predictor.sample
              puts "\"AI\" answer is: #{z}!"
                      if answer.count("O") + z.count("O") == z[-1].to_i
                        puts "Unfortunatelly, \"AI\" is won!\nWould you like to play once again?"
                            yes_no = false
                            while yes_no == false
                              answer = gets.chomp
                              answer = answer.upcase
                              if answer == "YES"
                                puts "Welcome to the game!\nYou are the predictor, what is your input?"
                                pred = "you"
                                yes_no = true
                              elsif answer == "NO"
                                puts "Bye, bye!"
                                game_won = true
                                yes_no = true
                              else puts "Wrong input! You may insert only \"Yes\" or \"No\" answers!"
                            break if yes_no == true
                              end
                            end
                      else
                        puts "\"AI\" guess is wrong! Now you are the predictor! What is your input?"
                        pred = "you"
                      end
            else puts "1st and 2nd symbols must be \"O\" or \"C\" only!"
            end
break if game_won == true
    end
end

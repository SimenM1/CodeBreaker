#generate 4 color code from 6 options
class Game
  def computer_generated_colors
    colors = ["yellow", "blue", "green", "violet", "red", "orange"]
    index = rand(5)
    return colors[index]
  end

  def initialize()
    @code_colors = [computer_generated_colors, computer_generated_colors, computer_generated_colors, computer_generated_colors]
    @user_colors
  end

  def user_guess()
    @user_colors = [gets.chomp, gets.chomp, gets.chomp, gets.chomp]
  end

  def compare()
    feedback = ""
    no_replica_user = @user_colors
    for i in 0..3 #ech iteration removes when it matches. Red first
      code_colors_compare = @code_colors
      if @user_colors[i] == code_colors_compare[i]
        code_colors_compare[i] = " "
        feedback += "red marker, "
      end

      if code_colors_compare.include?(@user_colors[i])
        code_colors_compare[i] = " "
        feedback += "white marker, "
      end
    end
    puts feedback
  end

  def play_game()
    until @user_colors == @code_colors
      puts "make your best guess!"
      user_guess()
      compare()
    end
    puts "omg, you win!"
  end
end

guessers = Game.new()
guessers.play_game
#generate 4 color code from 6 options
class GameComputerSets
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
    code_colors_compare = Marshal.load(Marshal.dump(@code_colors))
    user_colors_compare = Marshal.load(Marshal.dump(@user_colors))
    for i in 0..3
      if user_colors_compare[i] == code_colors_compare[i]
        user_colors_compare[i] = "x"
        code_colors_compare[i] = " "
        feedback += "red marker, "
      end
    end

    for i in 0..3
      if code_colors_compare.include?(user_colors_compare[i])
        code_color_index = code_colors_compare.find_index(user_colors_compare[i])
        user_colors_compare[i] = "x"
        code_colors_compare[code_color_index] = " "
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

gamerz = GameComputerSets.new()
gamerz.play_game

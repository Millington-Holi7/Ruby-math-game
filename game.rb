require_relative 'player'

class Game
  attr_accessor :current_player, :other_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @other_player = player2
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    { question: "What does #{num1} + #{num2} equal?", answer: num1 + num2 }
  end

  def play
    while @player1.alive? && @player2.alive?
      q = generate_question
      puts "#{current_player.name}, #{q[:question]}"

      answer = gets.chomp.to_i
      if answer == q[:answer]
        puts "Yes! You are corrrect"
      else
        puts "Seriously? No!"
        current_player.lose_life
      end

      if !current_player.alive?
        puts "#{other_player.name} wins with a score of #{other_player.lives}/3."
        puts "Game over!"
        break
      else
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      end

      switch_players
    end
  end
end

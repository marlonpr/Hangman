class Game
  def initialize
    @key = generate_key
    @key_clues = ''
    @key.length.times { @key_clues << '_' }
    @guessed = []
    @guesses = 10
    @existing_error = "You've already guessed that letter!"
  end

  def request_guess
    display
    print 'Enter  letter. or type save to save progress:'
    guess = gets.chomp
    return 'save' if guess == 'save'
    raise "Invalid input: #{guess}" unless /[[:alpha:]]/.match(guess) && guess.length == 1

    existing_guess = (guessed & [guess.green, guess.magenta]).any?
    raise @existing_error if existing_guess

    enter_guess(guess.downcase)
  rescue StandardError => e
    puts e.to_s.red
    retry
  end
end

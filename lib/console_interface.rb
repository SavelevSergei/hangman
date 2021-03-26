class ConsoleInterface
  FIGURES =
    Dir[__dir__ + '/../data/figures/*.txt']
    .sort
    .map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts "Слово: #{word_to_show}".colorize(:light_blue)
    puts "#{figure}".colorize(:yellow)
    puts "Ошибки (#{@game.errors_made}): #{errors_to_show}".colorize(:red)
    puts "У вас осталось ошибок: #{@game.errors_allowed}".colorize(:green)

    if @game.won?
      puts "Вы выиграли!!!".colorize(:light_blue)
    elsif @game.lost?
      puts "Вы проиграли! Загаданное слово - #{@game.word?}".colorize(:blue)
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter.nil?
          '__'
        else
          letter
        end
      end
    result.join(' ')
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def get_input
    print 'Введите следующую букву: '
    gets[0].upcase
  end
end

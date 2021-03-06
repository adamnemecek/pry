class Pry
  class Command::PryBacktrace < Pry::ClassCommand
    match 'pry-backtrace'
    group 'Context'
    description 'Show the backtrace for the Pry session.'

    banner <<-BANNER
      Usage:   pry-backtrace [OPTIONS] [--help]

      Show the backtrace for the position in the code where Pry was started. This can be used to
      infer the behavior of the program immediately before it entered Pry, just like the backtrace
      property of an exception.

      (NOTE: if you are looking for the backtrace of the most recent exception raised,
      just type: `_ex_.backtrace` instead, see https://github.com/pry/pry/wiki/Special-Locals)

      e.g: pry-backtrace
    BANNER

    def process
      stagger_output text.bold('Backtrace:') +
        "\n--\n" + _pry_.backtrace.join("\n")
    end
  end

  Pry::Commands.add_command(Pry::Command::PryBacktrace)
end

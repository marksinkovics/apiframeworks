require 'optparse'
require 'optparse/time'
require 'ostruct'

class Parser

    class CmdArguments
        attr_accessor :verbose,
            :vapor, :kitura, :express, :sinatra

        def initialize
            @verbose = false
            set_all(true)
        end

        def set_all(value)
            @vapor = value
            @kitura = value
            @express = value
            @sinatra = value
        end

    end

    def initialize
        @arguments = CmdArguments.new()
    end


    def define_specific_options(parser)
        boolean_verbose_option(parser)
        boolean_kitura_option(parser)
        boolean_vapor_option(parser)
        boolean_express_option(parser)
        boolean_sinatra_option(parser)
    end

    def define_options(parser)
        parser.banner += " [arguments...]"
        parser.version = "0.0.1"
        parser.separator ""
        parser.separator "Specific options:"

        define_specific_options(parser)

        parser.separator ""
        parser.separator "Common options:"

        parser.on_tail("-h", "--help", "Show this message") do
            puts parser
            exit
        end
    end

    def boolean_verbose_option(parser)
      parser.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        @arguments.verbose = v
      end
    end

    def boolean_kitura_option(parser)
        parser.on("--kitura", "--[no-]kitura", "Kitura framework") do |k|
            @arguments.set_all(false) if k
            @arguments.kitura = k
        end
    end

    def boolean_vapor_option(parser)
        parser.on("--vapor", "--[no-]vapor", "Vapor framework") do |v|
            @arguments.set_all(false) if v
            @arguments.vapor = v
        end
    end

    def boolean_express_option(parser)
        parser.on("--express", "--[no-]express", "Express framework") do |e|
            @arguments.set_all(false) if e
            @arguments.express = e
        end
    end

    def boolean_sinatra_option(parser)
        parser.on("--sinatra", "--[no-]sinatra", "Sinatra framework") do |e|
            @arguments.set_all(false) if e
            @arguments.sinatra = e
        end
    end

    def parse(args)
        @args = OptionParser.new do |parser|
            self.define_options(parser)
            begin
                parser.parse!(args)
            rescue OptionParser::ParseError => error
                $stderr.puts error
                $stderr.puts "(-h or --help will show valid options)"
                exit 1
            end
        end
        @arguments
    end
end
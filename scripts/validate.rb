#!/usr/bin/env ruby

require_relative 'utils/parser.rb'
require_relative 'utils/colorize.rb'

require_relative '../node/express/validator.rb'
require_relative '../swift/kitura/validator.rb'
require_relative '../swift/vapor/validator.rb'

class Validate

  attr_accessor :arguments

  def validate(name, validator_class)
    puts("Validate framework: #{name}".bold)
    validator = validator_class.new(@arguments)
    validator.start
    validator.validate
    validator.stop
  end

  def run()
    parser = Parser.new
    @arguments = parser.parse(ARGV)

    if @arguments.vapor
      validate("swift/Vapor", VaporValidator)
    end

    if @arguments.kitura
      validate("swift/Kitura", KituraValidator)
    end

    if @arguments.express
      validate("node/Express", ExpressValidator)
    end
  end
end

validate = Validate.new()
validate.run()
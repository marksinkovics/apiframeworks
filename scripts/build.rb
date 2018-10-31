#!/usr/bin/env ruby

require 'pp'

require_relative 'utils/parser.rb'
require_relative 'utils/colorize.rb'

require_relative '../node/express/builder.rb'
require_relative '../swift/kitura/builder.rb'
require_relative '../swift/vapor/builder.rb'

class Build

  attr_accessor :arguments

  def build(name, builder_class)
    puts("Build framework: #{name}".bold)
    builder = builder_class.new(@arguments)
    builder.update
    builder.build
  end

  def run()
    parser = Parser.new
    @arguments = parser.parse(ARGV)

    if @arguments.vapor
      build("swift/Vapor", VaporBuilder)
    end

    if @arguments.kitura
      build("swift/Kitura", KituraBuilder)
    end

    if @arguments.express
      build("node/Express", ExpressBuilder)
    end
  end
end

build = Build.new()
build.run()
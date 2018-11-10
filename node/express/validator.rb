require_relative '../../scripts/utils/validator.rb'

class ExpressValidator < Validator
    def start
        @server = Server.new("node src/index.js", File.join(__dir__, 'ExpressApp'), @arguments)
        super
    end
end
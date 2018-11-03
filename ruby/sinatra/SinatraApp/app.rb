require 'sinatra/base'

require_relative 'routes/api/api.rb'
require_relative 'routes/admin.rb'

class App < Sinatra::Base

    use APIController
    use AdminController

    if __FILE__ == $0
        set :port, 8080
        run!
    end
 end
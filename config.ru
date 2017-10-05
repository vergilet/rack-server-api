# require './server/actions/index'
# require './server/actions/show'
# require './server/actions/create'
# require './server/actions/put'
# require './server/actions/patch'
# require './server/actions/delete'

require './app/user/index'
require './app/user/create'
require './app/user/show'
require './app/user/put'
require './app/user/patch'
require './app/user/delete'
require 'hanami/router'

app = Hanami::Router.new(parsers: [:json]) do
  get     '/',          to: ->(env) { [200, {}, ['Welcome to API']] }
  get     '/users',     to: ->(env) { User::Index.(env)             }
  post    '/users',     to: ->(env) { User::Create.(env)            }
  get     '/users/:id', to: ->(env) { User::Show.(env)              }
  put     '/users/:id', to: ->(env) { User::Put.(env)               }
  patch   '/users/:id', to: ->(env) { User::Patch.(env)             }
  delete  '/users/:id', to: ->(env) { User::Delete.(env)            }
end

Rack::Server.start app: app, Port: 3000

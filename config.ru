require './app/user/index'
require './app/user/create'
require './app/user/show'
require './app/user/put'
require './app/user/patch'
require './app/user/delete'

require 'hanami/router'

app = Hanami::Router.new(parsers: [:json]) do

  action = -> (klass) { ->(env) { klass.(env) } }

  get     '/',          to: ->(_env) { [200, {}, ['Welcome to API']] }
  get     '/users',     to: action.(User::Index)
  post    '/users',     to: action.(User::Create)
  get     '/users/:id', to: action.(User::Show)
  put     '/users/:id', to: action.(User::Put)
  patch   '/users/:id', to: action.(User::Patch)
  delete  '/users/:id', to: action.(User::Delete)
end

Rack::Server.start app: app, Port: 3000

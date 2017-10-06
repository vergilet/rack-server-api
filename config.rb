require './app/endpoints/user/index'
require './app/endpoints/user/create'
require './app/endpoints/user/show'
require './app/endpoints/user/put'
require './app/endpoints/user/patch'
require './app/endpoints/user/delete'

require './app/endpoints/account/index'
require './app/endpoints/account/show'

require 'hanami/router'

router = Hanami::Router.new(parsers: [:json]) do
  action = ->(klass) { ->(env) { klass.call(env) } }

  get     '/',          to: ->(_env) { [200, {}, ['Welcome to API']] }
  get     '/users',     to: action.call(User::Index)
  post    '/users',     to: action.call(User::Create)
  get     '/users/:id', to: action.call(User::Show)
  put     '/users/:id', to: action.call(User::Put)
  patch   '/users/:id', to: action.call(User::Patch)
  delete  '/users/:id', to: action.call(User::Delete)

  get     '/accounts',     to: action.call(Account::Index)
  get     '/accounts/:id', to: action.call(Account::Show)
end

Rack::Server.start app: router #, Port: ENV['PORT']

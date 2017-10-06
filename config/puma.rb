threads_count = ENV.fetch('RAILS_MAX_THREADS') { 4 }.to_i
threads threads_count, threads_count
port ENV.fetch('PORT') { $PORT }
environment ENV.fetch('RAILS_ENV') { 'production' }

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

preload_app!

# on_worker_boot do
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end

plugin :tmp_restart

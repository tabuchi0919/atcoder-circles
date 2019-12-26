# frozen_string_literal: true

threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
threads threads_count, threads_count
port        ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RAILS_ENV') { 'development' }
plugin :tmp_restart

# threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
# threads threads_count, threads_count
# port        ENV.fetch('PORT') { 3000 }
# environment ENV.fetch('RAILS_ENV') { 'development' }
# ssl_bind '0.0.0.0', '9292', {
#   key: 'tmp/privkey1.pem',
#   cert: 'tmp/cert1.pem',
#   ca: 'tmp/chain1.pem',
#   verify_mode: "force_peer"
# }
# plugin :tmp_restart

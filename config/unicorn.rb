deploy_to = File.join(File.dirname(File.expand_path(__FILE__)), '..')
pid_file   = "#{deploy_to}/shared/pids/unicorn.pid"
socket_file= "#{deploy_to}/shared/unicorn.sock"
log_file   = "#{deploy_to}/log/unicorn.log"
err_log    = "#{deploy_to}/log/unicorn_error.log"
old_pid    = pid_file + '.oldbin'

timeout ENV["UNICORN_TIMEOUT"] && ENV["UNICORN_TIMEOUT"].to_i || 30
worker_processes ENV["UNICORN_COUNT"] && ENV["UNICORN_COUNT"].to_i || 2
listen socket_file, :backlog => 1024
preload_app true
pid pid_file
stderr_path err_log
stdout_path log_file


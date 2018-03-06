#! /usr/bin/ruby

require 'json'
require 'parallel'
require 'optparse'
require 'yaml'

#
# Parsing scripts arguments
#
class OptparseOS
  def self.parse(args)
    options = OpenStruct.new
    options.list = false

    opt_parser = OptionParser.new do |opts|
      opts.on('-l', '--list', 'list running vagrants') do |l|
        options.list = l
      end

      opts.on('-g', '--get-ssh', 'get ssh connection parameters') do |g|
        options.get_ssh = g
      end

      opts.on('-s NAME', '--show=NAME', 'show vagrant details') do |s|
        options.show = s
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end
    opt_parser.parse!(args)
    options
  end
end

#
# list running vagrant
#
def list_running_hosts
    # cmd = "vagrant status --machine-readable"
    status = %x(vagrant status --machine-readable)
    hosts = []

    status.split("\n").each do |line|
      ts, host, state_key, state_value = line.split(',')
      hosts << host if state_key == 'state' and state_value == 'running'
    end

    hosts
end

#
# get ansible connection details
#
def get_host_details host
  config = %x(vagrant ssh-config #{host})
  host, user, port = config.match(/Hostname (.*)\n.*User (.*)\n.*Port (.*)\n/i).captures

  {
    'ansible_ssh_host': host,
    'ansible_ssh_port': port
  }
end

#
# get ssh connection
#
def get_ssh
  config = %x(vagrant ssh-config)
  host, user, port = config.match(/Hostname (.*)\n.*User (.*)\n.*Port (.*)\n/i).captures
  "#{host}:#{port}"
end

#
# generate the full inventory with hostvars
#
def list_vagrant
  inventory = {}
  list_running_hosts.each do |host|
    inventory[host] = get_host_details host, output
  end

  puts JSON.pretty_generate inventory
end

#
# Main scope
#
if __FILE__ == $0
  options = OptparseOS.parse(ARGV)

  if options.list
    list_vagrant
  elsif options.get_ssh
    get_ssh
  elsif options.show
    puts get_host_details options.show
  end

  exit 0
end

#!/usr/bin/ruby
require 'rubygems'
require 'irb/completion'
require 'wirble'
require 'irb/ext/save-history'
require 'pp'

Wirble.init
Wirble.colorize

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT] = true

def profile
    t = Time.now
    yield
          "Took #{Time.now - t} seconds."
end

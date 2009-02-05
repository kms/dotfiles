#!/usr/bin/ruby
# ~/.irbrc
# Karl-Martin Skontorp <kms@skontorp.net> ~ http://picofarad.org/

require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
require 'wirble'
require 'pp'

Wirble.init
Wirble.colorize

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :CLASSIC

def profile
    t = Time.now
    yield
          "Took #{Time.now - t} seconds."
end

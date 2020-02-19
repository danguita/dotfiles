require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

# irb conf
IRB.conf[:AUTO_INDENT] = true

# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

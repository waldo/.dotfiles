require "rubygems"
require "irb/completion"
require "awesome_print"
AwesomePrint.irb!

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 20_000
IRB.conf[:HISTORY_FILE] = '~/.irb-history'

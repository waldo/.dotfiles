require "rubygems"
require "irb/completion"
if ENV.include?("RAILS_ENV") || defined?(Rails)
  $: << "~/.awesome_print"
end
require "awesome_print"

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_READLINE] = true

unless IRB.version.include?("DietRB")
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
else # MacRuby
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end

module Readline
  module History
    LOG = "#{ENV['HOME']}/.irb-history"

    def self.write_log(line)
      File.open(LOG, 'ab') {|f| f << "#{line}\n"}
    end

    def self.start_session_log
      write_log("# session start: #{Time.now}")
      at_exit { write_log("# session stop: #{Time.now}") }
    end
  end

  alias :old_readline :readline
  def readline(*args)
    ln = old_readline(*args)
    begin
      History.write_log(ln)
    rescue
    end
    ln
  end
end

Readline::History.start_session_log

=begin

Created By: Shobhit Jain
Task : Resume generator

=end

PHONE_NUMBER_REGEX = /^\(?[\d]{3}\)?[\s|-]?[\d]{3}-?[\d]{4}$/
EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
DOB_REGEX = /\d{4}-(0[1-9]|1[0-2])-/

require_relative "modules.rb"

include ResumeGeneration

ResumeGenerator.new

BEGIN{
    puts "===================================Resume Generator================================="
}

END{
    puts "===================================================================================="
}

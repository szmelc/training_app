set :output, "#{path}/log/cron.log"

every 1.day, at: "12:06 pm" do
  rake "report:posts_daily", environment: 'development'
end


every 1.month, at: "00:00 am" do
  rake "report:posts_monthly", environment: 'development'
end

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "User.new.send_welcome_email"
# end

# Learn more: http://github.com/javan/whenever

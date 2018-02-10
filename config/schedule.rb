set :output, "#{path}/log/cron.log"

every 1.day, at: "00:00 am" do
  rake "report:posts_daily", environment: 'development'
end

every 1.month, at: "00:00 am" do
  rake "report:posts_monthly", environment: 'development'
end

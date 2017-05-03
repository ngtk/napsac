notification :terminal_notifier if `uname` =~ /Darwin/

guard :shell do
  watch /provisioning\/roles\/(.*)\/(tasks|vars)\/.*\.yml/ do |match|
    puts "#{match[0]} has changed"
    role = match[1]
    cmd = "./provisioning/play.sh --tags #{role}"
    if system(cmd)
      n "success", "Provisioning", :success
    else
      n "failed", "Provisioning", :failed
    end
  end

  watch /provisioning\/(.*)^/ do
    cmd = "./provisioning/play.sh"
    if system(cmd)
      n "success", "Provisioning", :success
    else
      n "failed", "Provisioning", :failed
    end
  end
end

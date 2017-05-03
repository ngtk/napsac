guard :shell do
  watch /provisioning\/roles\/(.*)\/(tasks|vars)\/.*\.yml/ do |match|
    puts "#{match[0]} has changed"
    role = match[1]
    cmd = "./provisioning/play.sh --tags #{role}"
    system cmd
  end
end

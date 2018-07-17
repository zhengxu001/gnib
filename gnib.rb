require 'net/http'
require 'openssl'
require 'json'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
uri = URI('https://burghquayregistrationoffice.inis.gov.ie/Website/AMSREG/AMSRegWeb.nsf/(getAppsNear)?openpage&cat=Work&sbcat=All&typ=Renewal&_=1530172958153')
while true
	res = Net::HTTP.get_response(uri)
	print "\a" if JSON.parse(res.body)["empty"] != "TRUE"
	puts res.body
	current_time = Time.new
	puts "At Time : " + current_time.inspect
	sleep 2.5
end
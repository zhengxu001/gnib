require 'net/http'
require 'openssl'
require 'json'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# uri = URI('https://burghquayregistrationoffice.inis.gov.ie/Website/AMSREG/AMSRegWeb.nsf/(getAppsNear)?openpage&cat=Work&sbcat=All&typ=Renewal&_=1530172958153')
uri = URI('https://burghquayregistrationoffice.inis.gov.ie/Website/AMSREG/AMSRegWeb.nsf/(getAppsNear)?readform&cat=Work&sbcat=All&typ=New&k=11C1B124AC6ACF2E532080B68CD541E2&p=F8EDF3621F5802B8BC3CBF7226875075&_=1549443454726')
while true
	res = Net::HTTP.get_response(uri)
	print "\a" if JSON.parse(res.body)["empty"] != "TRUE"
	puts res.body
	current_time = Time.new
	puts "At Time : " + current_time.inspect
	sleep 2.5
end

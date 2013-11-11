require 'wombat'
# In terminal 'gem install wombat'
require 'mail'
# 'gem install mail'
# So I can send an email


class RubyGemsScraper
  include Wombat::Crawler

  base_url "http://www.zomp.com.au"
  path "/index.php/brand/2-baia-vista/2-baia-vista-311519-nero.html"

  product "css=h1"
  # Look for the first h1 
  price "css=#product-price-20749"
  # because I am using the id of the product, this is only relevant for this one page.

end

#Then make a new instance, and call the crawl method on it
results = RubyGemsScraper.new.crawl

#I'm most interested in price, so saving that as a variable
price = results["price"]

# Now the method for being able to send an email. Using mail gem
def send_mail
	mail = Mail.new do
	  from    'tracy@tracecode.com'
	  to      'tracy@moomumedia.com'
	  subject 'Price of Boots has changed!'
	  body    'Go check out the 2 Baia Vista Boots'
	end
end

if price != "$230.00AU"
	puts "It's changed!"
	send_mail
	# here I am trying to run my mail script (method?) below
	# but it's saying "undefined local variable or method `send_mail' for main:Object"
else 
	puts "It's still $230. Boooo"
	# no need to send email
end


# By default, properties will return the text of the first matching element for the provided selector
# If you want to retrieve all the matching elements, use the option :list


#NEXT
# make it so that if that new class appears, you can see it

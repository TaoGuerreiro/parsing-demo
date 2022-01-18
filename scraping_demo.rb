require "open-uri"
require "nokogiri" # gem pour scrapper et interagir avec du XML

ingredient = "chocolate"
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

# p html_doc => l'ensemble du DOM
html_doc.search(".standard-card-new__article-title").each do |element|
  # p element
  puts element.text.strip
  puts "https://www.bbcgoodfood.com#{element.attribute("href").value}"
end

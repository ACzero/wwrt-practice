# chapter 2
require 'net/http'

class Crawler
  def initialize(urls)
    @urls = urls
  end

  def request_all
    threads = []
    @urls.each do |url|
      threads << Thread.new do
        res = request_url(url)
        results << res
      end
    end

    threads.each(&:join)
  end

  def results
    @results ||= Queue.new
  end

  def request_url(url)
    Net::HTTP.get_response(URI(url)).code
  end
end

# MRI下运行结果均为10
# Jruby下会出现9
100.times do
  crawler = Crawler.new(['http://www.baidu.com']*10)
  crawler.request_all

  size = crawler.results.size
  puts size if size < 10
end

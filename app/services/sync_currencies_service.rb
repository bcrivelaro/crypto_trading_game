class SyncCurrenciesService
  def self.call
    new.call
  end

  def call
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }

    cmc_links = []

    a.get('https://coinmarketcap.com/') do |page|
      table = page.search('.cmc-table')
      tbody = table.search('tbody')
      trs = tr = tbody.search('tr')

      tr = trs[0]
      tds = tr.search('td')

      name = tds[2].search('a')[0].search('p')[0].text
      symbol = tds[2].search('a')[0].search('p')[1].text
      price = tds[3].text
      percentage_last_24h_up = tds[4].children.first.children.first.attributes['class'].value.include?('up')
      percentage_last_24h = tds[4].text
      percentage_last_7d_up = tds[5].children.first.children.first.attributes['class'].value.include?('up')
      percentage_last_7d = tds[5].text
      market_cap = tds[6].search('span')[1].text
    end
  end
end

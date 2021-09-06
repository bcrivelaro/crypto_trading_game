# frozen_string_literal: true

class SyncCurrenciesService
  def self.call
    new.call
  end

  def call
    now = DateTime.now
    options_args = ['--enable-javascript', 'headless', '--no-sandbox',
                    '--disable-dev-shm-usage']
    options = Selenium::WebDriver::Chrome::Options.new(args: options_args)

    driver = Selenium::WebDriver.for(:chrome, options: options)
    driver.get('https://coinmarketcap.com/')
    sleep(15)

    table = driver.find_element(:css, '.cmc-table')
    tbody = table.find_element(:css, 'tbody')
    trs = tbody.find_elements(:css, 'tr')

    trs.each do |tr|
      tds = tr.find_elements(:css, 'td')

      if tds[2].text.include?("\n")
        name, symbol = tds[2].text.split("\n")
      else
        cmc_link_children = tds[2].find_element(:css, '.cmc-link')
                                  .find_elements(:xpath, '*')
        name = cmc_link_children[1].text
        symbol = cmc_link_children[2].text
      end

      price = BigDecimal(tds[3].text.gsub('$', '').gsub(',', ''))

      currency = Currency.find_or_create_by(name: name, symbol: symbol)
      currency.historic_values.create!(usd: price, btc: 1, value_at: now)
    rescue StandardError => e
      puts e
    end

    driver.quit
  end
end

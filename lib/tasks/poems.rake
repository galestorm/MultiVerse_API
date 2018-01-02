namespace :poems do
  desc "Fill database with poems"
  task fetch: :environment do
    require 'nokogiri'
    require 'open-uri'

    # clean database to avoid duplicates
    Poem.all.each do |poem|
      poem.destroy!
    end

    def scrape(url)
      poems = Nokogiri::HTML(open(url))

      poems.css('td.views-field-title a').each do |poem_page_anchor|
        poem_url = "https://www.poets.org" + poem_page_anchor["href"]
        poem_page = Nokogiri::HTML(open(poem_url))
        title = poem_page.css('h1#page-title').text
        author = poem_page.css('.view-display-id-poem_author_dob_dod a span').text
        if poem_page.css('.field-type-text-with-summary pre').inner_html != ""
          lines = poem_page.css('.field-type-text-with-summary pre').inner_html
        elsif poem_page.css('.field-type-text-with-summary .field-item').inner_html != ""
          lines = poem_page.css('.field-type-text-with-summary .field-item').inner_html
        else
          next
        end
        source = poem_page.css('#poem-content .poem-credit p').inner_html
        poem = Poem.new(
          title: title,
          author: author,
          lines: lines,
          source: source
        )
        poem.save
      end
    end

    BASE_URL = "https://www.poets.org/poetsorg/poems?field_occasion_tid=All&field_poem_themes_tid=1456&field_form_tid=All"

    scrape(BASE_URL)

    (1..130).each do |n|
      nth_page = BASE_URL + "&page=#{n}"

      scrape(nth_page)
    end
  end

  desc "Delete all poems"
  task clean: :environment do
    Poem.all.each do |poem|
      poem.destroy!
    end
  end

end

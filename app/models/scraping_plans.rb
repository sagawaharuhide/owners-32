require 'mechanize'

 class Scraping_plans

   def self.plans_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://owner-style.com")
    elements = current_page.search('.plan_card_medium')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_plans_information("https://owner-style.com" + link)
    end
   end

   def self.get_plans_information(link)
    agent = Mechanize.new
    page = agent.get(link)
    producer = page.at('.organization_name').inner_text
    area = page.at('.location_name').inner_text
    dead_line = page.at('.date').inner_text
    img_url = page.at('.cover_img_wrap').get_attribute('style').match(/https?:\/\/[\S]+.jpg/).to_s
    avatar = page.at('.container .d-flex div').get_attribute('style').match(/https?:\/\/[\S]+.jpg/).to_s
    title = page.at('.cover_img_wrap h1').inner_text
    plan = Plan.where(producer: producer, area: area, dead_line: dead_line, img_url: img_url, title: title, avatar: avatar).first_or_initialize
    plan.save
   end

 end

require 'mechanize'

 class ScrapingCourses

   def self.courses_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://owner-style.com")
    elements = current_page.search('.plan_card_medium')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_courses_information("https://owner-style.com" + link)
    end
   end

   def self.get_courses_information(link)
    agent = Mechanize.new
    page = agent.get(link)
    name = page.at('.card-title').inner_text
    price = page.at('.price').inner_text.gsub(/[^\d]/, "").to_i
    detail = page.at('.card-body p').inner_text
    course = Course.where(name: name, price: price, plan_id: 371, detail: detail ).first_or_initialize
    course.save!
   end

 end

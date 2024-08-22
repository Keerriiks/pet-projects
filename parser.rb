require 'nokogiri'
require 'httparty'

url = "https://webcaster.dev/client/docs/v4.0/apps_api"  # Замените URL на нужный вам
response = HTTParty.get(url)

# Парсинг HTML с помощью Nokogiri
page = Nokogiri::HTML(response.body)

# Извлечение заголовка страницы
title = page.css('title').text
puts "Заголовок страницы: #{title}"
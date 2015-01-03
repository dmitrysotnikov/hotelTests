module CommonHelper

  require 'rubygems'
  require 'active_support'
  require 'active_support/core_ext/numeric/time'
  require 'chronic'

  def unique_email(email)
    if email.include? "pre-setup"
      email.gsub("pre-setup ", "")
    else
      "#{(EnvConfig.get :email).split('@').first}+#{email}#{@random_string}@gmail.com"
    end
  end

  def unique_value(value)
    if value.include? "pre-setup"
        value.gsub("pre-setup ", "")
    else
        value + @random_string
    end
  end

  def parse_link_from(message, link_text)
    doc = Nokogiri::HTML(message)
    node = doc.search('a').detect { |a| a.text == link_text }
    if node
      node['href']
    else
      span = doc.search('a span').detect {|span| span.text == link_text}
      puts span
      node = span.parent
      node['href']
    end
  end

  def convert_time(time, format)
    if time.include? 'today'
      parsed_time = time.split('today')
      if parsed_time.size < 2
        Time.now.strftime(format)
      else
        shift = time.gsub(/\D/, '').to_i.days.to_i
        parsed_time = (time.include? '+') ? Time.now + shift : Time.now - shift
        parsed_time.strftime(format)
      end
    end
  end

  def convert_date(date)
    Chronic.parse(date).strftime('%Y-%m-%d')
  end
end

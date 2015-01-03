
Dir["#{File.dirname(__FILE__)}/pages/*/sections/*_section.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*/*_page.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*/*_pop_up.rb"].each {|r| load r }
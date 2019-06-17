require 'rspec'
require 'watir'
require 'faker'


Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
  unless @browser
    @browser = Watir::Browser.new :chrome
  end
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

  if @browser
    @browser.quit
    @browser = nil
  end
end

Before('@data_purge') do
  unless @browser
    @browser = Watir::Browser.new :chrome
  end

  @browser.goto('http://localhost:3000/reset_database')
end

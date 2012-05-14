require 'frank-mortiz/mortiz_helper'

World(Frank::Cucumber::MortizHelper)

AfterConfiguration do
  require 'frank-mortiz/mortiz_steps'
end

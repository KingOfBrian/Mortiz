When /^I restart the app$/ do
  frank_open_mortiz_then_quit_after 4
  sleep 5
  mortiz_open_app
  sleep 5
end

When /^I suspend the app$/ do
  frank_open_mortiz
end

When /^I resume the app$/ do
  sleep 5
  mortiz_open_app
end

When /^I suspend the app then quit$/ do
  frank_open_mortiz_then_quit_after 5
end

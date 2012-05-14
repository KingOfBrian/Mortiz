
module Frank 
module MortizHelper 
  MORTIZ_PORT = 37264
  MORTIZ_DEFAULT_APP_URL = nil

  def mortiz_exec(method_name, *method_args)
    operation_map = {
      :method_name => method_name,
      :arguments => method_args
    }
    
    res = post_to_mortiz_server( 'app_exec', :operation => operation_map )

    res = JSON.parse( res )
    if res['outcome'] != 'SUCCESS'
      raise "app_exec #{method_name} failed because: #{res['reason']}\n#{res['details']}"
    end

    res['results']
  end

  def post_to_mortiz_server( verb, command_hash )
    url = frank_url_for( verb, MORTIZ_PORT )
    req = Net::HTTP::Post.new url.path
    req.body = command_hash.to_json

    make_http_request( url, req )
  end

  def frank_open_mortiz
    app_exec( 'openURLString:', "mortiz://open/" )
  end

  def frank_open_mortiz_then_quit_after(count)
    app_exec( 'openURLString:thenQuitAfterCount:', "mortiz://open/", count )
  end

  def mortiz_open_app
    raise "Must set Frank::Mortiz::MORTIZ_DEFAULT_APP_URL to the URL handler for your app" if MORTIZ_DEFAULT_APP_URL == nil
    mortiz_open_url MORTIZ_DEFAULT_APP_URL
  end

  def mortiz_open_url( url )
    mortiz_exec( 'openURLString:', url )
  end

end
end


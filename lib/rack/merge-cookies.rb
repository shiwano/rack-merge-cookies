module Rack
  class MergeCookies
    def initialize(app, options = {})
      @app, @header_name = app, options[:header_name]
    end

    def custom_cookie_name
      'HTTP_' + @header_name.upcase.gsub('-', '_')
    end

    def call(env)
      custom_cookie = env[custom_cookie_name]
      unless custom_cookie.nil?
        cookie = (env['HTTP_COOKIE'] || '').gsub(/;$/, '')
        env['HTTP_COOKIE'] = cookie + '; ' + custom_cookie
      end
      @app.call(env)
    end
  end
end

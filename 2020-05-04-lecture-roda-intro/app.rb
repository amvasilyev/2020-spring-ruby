require "roda"

class App < Roda
  route do |r|
    # GET / request
    r.root do
      r.redirect "/hello"
    end

    # /hello branch
    r.on "hello" do
      # Set variable for all routes in /hello branch
      @greeting = 'Hello with rerun'

      # GET /hello/world request
      r.get "world" do
        "#{@greeting} world!"
      end

      # /hello request
      r.is do
        # GET /hello request
        r.get do
          "#{@greeting}!"
        end

        # POST /hello request
        r.post do
          puts "Someone said #{@greeting}!"
          r.redirect
        end
      end
    end

    r.on "a" do           # /a branch
      r.on "b" do         # /a/b branch
        r.is "c" do       # /a/b/c request
          r.get do
            "Request from a/b/c"
          end    # GET  /a/b/c request
          r.post do end   # POST /a/b/c request
        end
        r.get "d" do
          "Request from 'd'"
        end  # GET  /a/b/d request
        r.post "e" do end # POST /a/b/e request
      end
    end

    # GET /post/2011/02/16/hello
    r.get "post", Integer, Integer, Integer, String do |year, month, day, slug|
      "#{year}-#{month}-#{day} #{slug}" #=> "2011-02-16 hello"
    end

    # /search?q=barbaz
    r.get "search" do
      "Searched for #{r.params['q']}" #=> "Searched for barbaz"
    end
  end
end

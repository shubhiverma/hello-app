class ApplicationController < ActionController::Base

  def hello
    render html: "<p>hello, rails!!!</p>"
  end
end

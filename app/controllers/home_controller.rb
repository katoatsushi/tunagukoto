class HomeController < ApplicationController
  def index
  	@events = Event.all
  	@infos = Information.all
  end
end

class HomeController < ApplicationController
  def index

    @people = Person.limit(10)
  end
end

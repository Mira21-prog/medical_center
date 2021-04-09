class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.searcher(params)
  end
end

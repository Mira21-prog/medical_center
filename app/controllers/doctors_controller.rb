class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.searcher(params)
  end

  def show
  end
end

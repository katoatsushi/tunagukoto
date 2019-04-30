class InformationsController < ApplicationController
  def new
    @info = Information.new
  end

  def create
    @info = Information.new(info_params)
    if @info.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end

  private 

  def info_params
    params.require(:information).permit(:info_header, :info_body, :info_url)
  end
end

class MuseumsController < ApplicationController
  def index
    @search = params[:search]
    @museums = @search ? Museum.search(@search) : @museums = Museum.all
  end

  def new
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(museum_params)

    if @museum.save
      redirect_to museums_path
    else
      render 'new'
    end
  end

  def show
    @museum = Museum.find(params[:id])
  end

  def edit
    @museum = Museum.find(params[:id])
  end

  def update
    @museum = Museum.find(params[:id])

    if @museum.update(museum_params)
      redirect_to museums_path
    else
      render 'edit'
    end
  end

  def destroy
    Museum.find(params[:id]).delete
    redirect_to museums_path
  end
end

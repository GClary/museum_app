class PaintingsController < ApplicationController
  def index
    @search = params[:search]
    @paintings = @search ? Painting.search(@search) : @paintings = Painting.all
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)

    if @painting.save
      redirect_to paintings_path
    else
      render 'new'
    end
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])

    if @painting.update(painting_params)
      redirect_to paintings_path
    else
      render 'edit'
    end
  end

  def destroy
    Painting.find(params[:id]).delete
    redirect_to paintings_path
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :year, :style)
  end
end

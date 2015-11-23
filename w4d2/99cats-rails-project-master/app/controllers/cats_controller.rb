class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    @dates = Hash.new(0)
    @cat.cat_rental_requests.each do |cat|
      @dates[cat.start_date] = cat.end_date
    end
    @dates = Hash[@dates.sort_by{|start_date, end_date| start_date}]
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
  end
end

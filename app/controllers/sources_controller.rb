class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  def index
    @sources = Source.ordered
  end

  def show
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)

    if @source.save
      respond_to do |format|
        format.html { redirect_to sources_path, notice: 'Source was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @source.update(source_params)
      redirect_to sources_path, notice: 'Source was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @source.destroy
    
    respond_to do |format|
      format.html { redirect_to sources_path, notice: 'Source was successfully destroyed.' }
      format.turbo_stream
    end
  end

  private

  def set_source
    @source = Source.find(params[:id])
  end

  def source_params
    params.require(:source).permit(:name)
  end
end

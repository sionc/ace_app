
class StatisticsSourcesController < ApplicationController
  # GET /statistics_sources
  # GET /statistics_sources.json
  def index
    @statistics_sources = StatisticsSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statistics_sources }
    end
  end

  # GET /statistics_sources/1
  # GET /statistics_sources/1.json
  def show
    @statistics_source = StatisticsSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistics_source }
    end
  end

  # GET /statistics_sources/new
  # GET /statistics_sources/new.json
  def new
    @statistics_source = StatisticsSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistics_source }
    end
  end

  # GET /statistics_sources/1/edit
  def edit
    @statistics_source = StatisticsSource.find(params[:id])
  end

  # POST /statistics_sources
  # POST /statistics_sources.json
  def create
    @statistics_source = StatisticsSource.new(params[:statistics_source])

    respond_to do |format|
      if @statistics_source.save
        format.html { redirect_to @statistics_source, notice: 'Statistics source was successfully created.' }
        format.json { render json: @statistics_source, status: :created, location: @statistics_source }
      else
        format.html { render action: "new" }
        format.json { render json: @statistics_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statistics_sources/1
  # PUT /statistics_sources/1.json
  def update
    @statistics_source = StatisticsSource.find(params[:id])

    respond_to do |format|
      if @statistics_source.update_attributes(params[:statistics_source])
        format.html { redirect_to @statistics_source, notice: 'Statistics source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statistics_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics_sources/1
  # DELETE /statistics_sources/1.json
  def destroy
    @statistics_source = StatisticsSource.find(params[:id])
    @statistics_source.destroy

    respond_to do |format|
      format.html { redirect_to statistics_sources_url }
      format.json { head :no_content }
    end
  end
end


class StatisticsSourceTypesController < ApplicationController
  # GET /statistics_source_types
  # GET /statistics_source_types.json
  def index
    @statistics_source_types = StatisticsSourceType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statistics_source_types }
    end
  end

  # GET /statistics_source_types/1
  # GET /statistics_source_types/1.json
  def show
    @statistics_source_type = StatisticsSourceType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistics_source_type }
    end
  end

  # GET /statistics_source_types/new
  # GET /statistics_source_types/new.json
  def new
    @statistics_source_type = StatisticsSourceType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistics_source_type }
    end
  end

  # GET /statistics_source_types/1/edit
  def edit
    @statistics_source_type = StatisticsSourceType.find(params[:id])
  end

  # POST /statistics_source_types
  # POST /statistics_source_types.json
  def create
    @statistics_source_type = StatisticsSourceType.new(params[:statistics_source_type])

    respond_to do |format|
      if @statistics_source_type.save
        format.html { redirect_to @statistics_source_type, notice: 'Statistics source type was successfully created.' }
        format.json { render json: @statistics_source_type, status: :created, location: @statistics_source_type }
      else
        format.html { render action: "new" }
        format.json { render json: @statistics_source_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statistics_source_types/1
  # PUT /statistics_source_types/1.json
  def update
    @statistics_source_type = StatisticsSourceType.find(params[:id])

    respond_to do |format|
      if @statistics_source_type.update_attributes(params[:statistics_source_type])
        format.html { redirect_to @statistics_source_type, notice: 'Statistics source type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statistics_source_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics_source_types/1
  # DELETE /statistics_source_types/1.json
  def destroy
    @statistics_source_type = StatisticsSourceType.find(params[:id])
    @statistics_source_type.destroy

    respond_to do |format|
      format.html { redirect_to statistics_source_types_url }
      format.json { head :no_content }
    end
  end
end


class StatisticsEntriesController < ApplicationController
  # GET /statistics_entries
  # GET /statistics_entries.json
  def index
    @statistics_entries = StatisticsEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statistics_entries }
    end
  end

  # GET /statistics_entries/1
  # GET /statistics_entries/1.json
  def show
    @statistics_entry = StatisticsEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistics_entry }
    end
  end

  # GET /statistics_entries/new
  # GET /statistics_entries/new.json
  def new
    @statistics_entry = StatisticsEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistics_entry }
    end
  end

  # GET /statistics_entries/1/edit
  def edit
    @statistics_entry = StatisticsEntry.find(params[:id])
  end

  # POST /statistics_entries
  # POST /statistics_entries.json
  def create
    @statistics_entry = StatisticsEntry.new(params[:statistics_entry])

    respond_to do |format|
      if @statistics_entry.save
        format.html { redirect_to @statistics_entry, notice: 'Statistics entry was successfully created.' }
        format.json { render json: @statistics_entry, status: :created, location: @statistics_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @statistics_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statistics_entries/1
  # PUT /statistics_entries/1.json
  def update
    @statistics_entry = StatisticsEntry.find(params[:id])

    respond_to do |format|
      if @statistics_entry.update_attributes(params[:statistics_entry])
        format.html { redirect_to @statistics_entry, notice: 'Statistics entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statistics_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics_entries/1
  # DELETE /statistics_entries/1.json
  def destroy
    @statistics_entry = StatisticsEntry.find(params[:id])
    @statistics_entry.destroy

    respond_to do |format|
      format.html { redirect_to statistics_entries_url }
      format.json { head :no_content }
    end
  end
end

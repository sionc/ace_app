
class ProcessManagersController < ApplicationController
  # GET /process_managers
  # GET /process_managers.json
  def index
    @process_managers = ProcessManager.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @process_managers }
    end
  end

  # GET /process_managers/1
  # GET /process_managers/1.json
  def show
    @process_manager = ProcessManager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @process_manager }
    end
  end

  # GET /process_managers/new
  # GET /process_managers/new.json
  def new
    @process_manager = ProcessManager.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @process_manager }
    end
  end

  # GET /process_managers/1/edit
  def edit
    @process_manager = ProcessManager.find(params[:id])
  end

  # POST /process_managers
  # POST /process_managers.json
  def create
    @process_manager = ProcessManager.new(params[:process_manager])

    respond_to do |format|
      if @process_manager.save
        format.html { redirect_to @process_manager, notice: 'Process manager was successfully created.' }
        format.json { render json: @process_manager, status: :created, location: @process_manager }
      else
        format.html { render action: "new" }
        format.json { render json: @process_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /process_managers/1
  # PUT /process_managers/1.json
  def update
    @process_manager = ProcessManager.find(params[:id])

    respond_to do |format|
      if @process_manager.update_attributes(params[:process_manager])
        format.html { redirect_to @process_manager, notice: 'Process manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @process_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_managers/1
  # DELETE /process_managers/1.json
  def destroy
    @process_manager = ProcessManager.find(params[:id])
    @process_manager.destroy

    respond_to do |format|
      format.html { redirect_to process_managers_url }
      format.json { head :no_content }
    end
  end

  # GET /process_managers/get_current_statistics.json?id=1
  def get_current_statistics
    @process_manager = ProcessManager.find(params[:id])
    last_entry = StatisticsEntry.last.id
    last_stats = DataItemValue.where(:statistics_entry_id => last_entry)
    last_stats_by_data_item_id = Hash.new
    last_stats.each do |ls|
        last_stats_by_data_item_id[ls.data_item_id] = ls.current_value
    end
    sources = @process_manager.statistics_sources
    source_list = sources.map do |s|
      data_items = s.data_items
      data_item_list = data_items.map do |di|
        type = di.data_item_type
        {:name => type.name,
         :unit => type.unit,
         :default_value => type.default_value,
         :current_value => last_stats_by_data_item_id[di.id]
        }
      end

      { :type => s.statistics_source_type.name,
        :path => s.source_path,
        :data_items => data_item_list }
    end

    respond_to do |format|
      format.json { render json: {:path => @process_manager.workspace_path,
                                  :statistics_sources => source_list} }
    end
  end
end

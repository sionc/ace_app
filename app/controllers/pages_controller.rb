class PagesController < ApplicationController
  #
  # Devise
  #
  #before_filter :authenticate_user!, :except => [:start, :about]
  before_filter :authenticate_user!

  # GET "pages/dashboard"
  def dashboard
    last_entry = StatisticsEntry.last
    source_type = StatisticsSourceType.where(:name => "Process Manager").last
    source = source_type.statistics_sources.where(:process_manager_id => ProcessManager.last.id).last

    parts_processed_type_id = DataItemType.where(:name => "Parts Processed").last.id
    parts_per_minute_type_id = DataItemType.where(:name => "Parts Per Minute").last.id
    processing_time_type_id = DataItemType.where(:name => "Processing Time").last.id
    total_up_time_type_id = DataItemType.where(:name => "Average Total Time").last.id

    data_items = source.data_items

    parts_processed_id = data_items.where(:data_item_type_id => parts_processed_type_id).last.id
    parts_per_minute_id = data_items.where(:data_item_type_id => parts_per_minute_type_id).last.id
    processing_time_id = data_items.where(:data_item_type_id => processing_time_type_id).last.id
    total_up_time_id = data_items.where(:data_item_type_id => total_up_time_type_id).last.id

    data_item_values = DataItemValue.where(:statistics_entry_id => last_entry.id)

    parts_processed = data_item_values.where(:data_item_id => parts_processed_id).last.current_value.to_i
    parts_per_minute = data_item_values.where(:data_item_id => parts_per_minute_id).last.current_value
    processing_time = data_item_values.where(:data_item_id => processing_time_id).last.current_value
    total_uptime = data_item_values.where(:data_item_id => total_up_time_id).last.current_value/1000
    one_day = 3600 * 24
    one_hr = 3600
    one_min = 60
    total_uptime_str = ""
    total_uptime_str += ((total_uptime / one_day)).to_i.to_s + " d " unless (total_uptime < one_day)
    total_uptime_str += ((total_uptime % one_day)/one_hr).to_i.to_s + " h " unless (total_uptime < one_hr)
    total_uptime_str += ((total_uptime % one_hr)/one_min).to_i.to_s + " m"

    @pm_data_item_values = {"Parts Processed" => parts_processed, "Parts Per Minute" => parts_per_minute,
                            "Processing Time" => processing_time, "Total Uptime" => total_uptime_str}


    respond_to do |format|
      format.html
    end
  end

  # GET "pages/pricing"
  def pricing
  end

  # GET "pages/reports"
  def reports
  end

  # GET "pages/workspace"
  def workspace
  end

  # GET "pages/info"
  def info
  end

  # GET "pages/products"
  def products
  end

  # GET "pages/monitor"
  def monitor
    pm_id = ProcessManager.last.id
    @sources = StatisticsSource.includes(:statistics_source_type,
                                         :data_items => :data_item_type).where(:process_manager_id => pm_id)
    respond_to do |format|
      format.html
    end
  end
end
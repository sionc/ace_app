
class DataItemValuesController < ApplicationController
  # GET /data_item_values
  # GET /data_item_values.json
  def index
    @data_item_values = DataItemValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_item_values }
    end
  end

  # GET /data_item_values/1
  # GET /data_item_values/1.json
  def show
    @data_item_value = DataItemValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_item_value }
    end
  end

  # GET /data_item_values/new
  # GET /data_item_values/new.json
  def new
    @data_item_value = DataItemValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_item_value }
    end
  end

  # GET /data_item_values/1/edit
  def edit
    @data_item_value = DataItemValue.find(params[:id])
  end

  # POST /data_item_values
  # POST /data_item_values.json
  def create
    @data_item_value = DataItemValue.new(params[:data_item_value])

    respond_to do |format|
      if @data_item_value.save
        format.html { redirect_to @data_item_value, notice: 'Data item value was successfully created.' }
        format.json { render json: @data_item_value, status: :created, location: @data_item_value }
      else
        format.html { render action: "new" }
        format.json { render json: @data_item_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_item_values/1
  # PUT /data_item_values/1.json
  def update
    @data_item_value = DataItemValue.find(params[:id])

    respond_to do |format|
      if @data_item_value.update_attributes(params[:data_item_value])
        format.html { redirect_to @data_item_value, notice: 'Data item value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_item_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_item_values/1
  # DELETE /data_item_values/1.json
  def destroy
    @data_item_value = DataItemValue.find(params[:id])
    @data_item_value.destroy

    respond_to do |format|
      format.html { redirect_to data_item_values_url }
      format.json { head :no_content }
    end
  end
end

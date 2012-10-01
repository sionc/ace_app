
class DataItemTypesController < ApplicationController
  # GET /data_item_types
  # GET /data_item_types.json
  def index
    @data_item_types = DataItemType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_item_types }
    end
  end

  # GET /data_item_types/1
  # GET /data_item_types/1.json
  def show
    @data_item_type = DataItemType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_item_type }
    end
  end

  # GET /data_item_types/new
  # GET /data_item_types/new.json
  def new
    @data_item_type = DataItemType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_item_type }
    end
  end

  # GET /data_item_types/1/edit
  def edit
    @data_item_type = DataItemType.find(params[:id])
  end

  # POST /data_item_types
  # POST /data_item_types.json
  def create
    @data_item_type = DataItemType.new(params[:data_item_type])

    respond_to do |format|
      if @data_item_type.save
        format.html { redirect_to @data_item_type, notice: 'Data item type was successfully created.' }
        format.json { render json: @data_item_type, status: :created, location: @data_item_type }
      else
        format.html { render action: "new" }
        format.json { render json: @data_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_item_types/1
  # PUT /data_item_types/1.json
  def update
    @data_item_type = DataItemType.find(params[:id])

    respond_to do |format|
      if @data_item_type.update_attributes(params[:data_item_type])
        format.html { redirect_to @data_item_type, notice: 'Data item type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_item_types/1
  # DELETE /data_item_types/1.json
  def destroy
    @data_item_type = DataItemType.find(params[:id])
    @data_item_type.destroy

    respond_to do |format|
      format.html { redirect_to data_item_types_url }
      format.json { head :no_content }
    end
  end
end

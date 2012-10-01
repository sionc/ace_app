
class DataItemsController < ApplicationController
  # GET /data_items
  # GET /data_items.json
  def index
    @data_items = DataItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_items }
    end
  end

  # GET /data_items/1
  # GET /data_items/1.json
  def show
    @data_item = DataItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_item }
    end
  end

  # GET /data_items/new
  # GET /data_items/new.json
  def new
    @data_item = DataItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_item }
    end
  end

  # GET /data_items/1/edit
  def edit
    @data_item = DataItem.find(params[:id])
  end

  # POST /data_items
  # POST /data_items.json
  def create
    @data_item = DataItem.new(params[:data_item])

    respond_to do |format|
      if @data_item.save
        format.html { redirect_to @data_item, notice: 'Data item was successfully created.' }
        format.json { render json: @data_item, status: :created, location: @data_item }
      else
        format.html { render action: "new" }
        format.json { render json: @data_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_items/1
  # PUT /data_items/1.json
  def update
    @data_item = DataItem.find(params[:id])

    respond_to do |format|
      if @data_item.update_attributes(params[:data_item])
        format.html { redirect_to @data_item, notice: 'Data item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_items/1
  # DELETE /data_items/1.json
  def destroy
    @data_item = DataItem.find(params[:id])
    @data_item.destroy

    respond_to do |format|
      format.html { redirect_to data_items_url }
      format.json { head :no_content }
    end
  end
end

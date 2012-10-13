class PagesController < ApplicationController
  #
  # Devise
  #
  #before_filter :authenticate_user!, :except => [:start, :about]
  before_filter :authenticate_user!

  # GET "pages/dashboard"
  def dashboard
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
  end


end
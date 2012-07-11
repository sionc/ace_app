class PagesController < ApplicationController
  #
  # Devise
  #
  #before_filter :authenticate_user!, :except => [:start, :about]

  # GET "pages/account"
  def account
  end

  # GET "pages/charts"
  def charts
  end

  # GET "pages/dashboard"
  def dashboard
  end

  # GET "pages/error"
  def error
  end

  # GET "pages/faq"
  def faq
  end

  # GET "pages/login"
  def login
  end

  # GET "pages/pricing"
  def pricing
  end

  # GET "pages/reports"
  def reports
  end

  # GET "pages/signup"
  def signup
  end

  # GET "pages/workspace"
  def workspace
  end

  #def start
  #  respond_to do |format|
  #    if user_signed_in?
  #      format.html { redirect_to pages_home_path }
  #    else
  #      format.html
  #    end
  #  end
  #end
end
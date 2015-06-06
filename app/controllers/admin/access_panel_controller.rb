class Admin::AccessPanelController < ApplicationController
  layout 'semantic_ui'

  before_action :set_countries, except: [:dashboard, :index]
  before_action :authenticate_admin!, except:[:index]

  def dashboard  
  end

  def index
    
  end

  def country_selector
    @countries = Country.all
  end

  def state_selector
    @countries = Country.all
  end

  def city_selector
    @countries = Country.all
  end

  def area_selector
    @countries = Country.all
    render :select_area
  end

  private

  def set_countries
    @countries = Country.all
  end

end

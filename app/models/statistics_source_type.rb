class StatisticsSourceType < ActiveRecord::Base
  attr_accessible :name

  has_many :statistics_sources
end

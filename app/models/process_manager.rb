class ProcessManager < ActiveRecord::Base
  attr_accessible :workspace_path

  has_many :statistics_sources
end

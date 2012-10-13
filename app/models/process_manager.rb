class ProcessManager < ActiveRecord::Base
  attr_accessible :workspace_path

  has_many :statistics_sources
  has_many :statistics_entries
end

# Get the kwh usage for each day for the current week
def current_statistics
  #connection = ActiveRecord::Base.connection()
  #result[] = connection.execute(
  #    "SELECT *
  #      FROM data_item_values
  #      WHERE sensor_id = #{id}
  #      AND created_at BETWEEN '#{lower}' and '#{upper}'")
  #output = result.nil? ? 0.0 : (pgresult[0].values[0].to_f)/60/1000
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Deleting tests"
Test.delete_all

# Demo user
puts 'Creating test'
Test.create(:data => '20',
            :name => 'Random')

# Process Manager
puts 'Creating process_managers'
process_manager = ProcessManager.create(:workspace_path => '/Process/Process Manager')

# Statistics Source Type
puts 'Creating statistics_source_types'
source_process_manager = StatisticsSourceType.create(:name => 'Process Manager')
source_robot = StatisticsSourceType.create(:name => 'Robot')
source_belt = StatisticsSourceType.create(:name => 'Belt')
source_process_strategy = StatisticsSourceType.create(:name => 'Process Strategy')

# Statistics Source
puts 'Creating statistics_sources'
pm = StatisticsSource.create(:process_manager_id => process_manager.id,
                         :statistics_source_type_id => source_process_manager.id,
                         :source_path => 'Process Manager:/Process/Process Manager')
robot_1 = StatisticsSource.create(:process_manager_id => process_manager.id,
                         :statistics_source_type_id => source_robot.id,
                         :source_path => 'Robot:/Devices/Robot 1')
front_belt = StatisticsSource.create(:process_manager_id => process_manager.id,
                         :statistics_source_type_id => source_belt.id,
                         :source_path => 'Belt:/Process/Front Belt')
robot_2 = StatisticsSource.create(:process_manager_id => process_manager.id,
                         :statistics_source_type_id => source_robot.id,
                         :source_path => 'Robot:/Devices/Robot 2')
rear_belt = StatisticsSource.create(:process_manager_id => process_manager.id,
                         :statistics_source_type_id => source_belt.id,
                         :source_path => 'Belt:/Process/Rear Belt')
ps = StatisticsSource.create(:process_manager_id => process_manager.id,
                         :statistics_source_type_id => source_process_strategy.id,
                         :source_path => 'Process Strategy:/Process/Process Manager')


# Data Item Type
puts 'Creating data_item_types'
type_idle_time = DataItemType.create(:name => 'Idle Time',
                    :unit => '%',
                    :default_value => 0.0)
type_processing_time = DataItemType.create(:name => 'Processing Time',
                    :unit => '%',
                    :default_value => 0.0)
type_average_total_time = DataItemType.create(:name => 'Average Total Time',
                    :unit => 'ms',
                    :default_value => 0.0)
type_parts_per_minute = DataItemType.create(:name => 'Parts Per Minute',
                    :unit => '',
                    :default_value => 0.0)
type_targets_per_minute = DataItemType.create(:name => 'Targets Per Minute',
                    :unit => '',
                    :default_value => 0.0)
type_parts_not_processed = DataItemType.create(:name => 'Parts Not Processed',
                    :unit => '',
                    :default_value => 0.0)
type_targets_not_processed = DataItemType.create(:name => 'Targets Not Processed',
                    :unit => '',
                    :default_value => 0.0)
type_parts_processed = DataItemType.create(:name => 'Parts Processed',
                    :unit => '',
                    :default_value => 0.0)
type_targets_processed = DataItemType.create(:name => 'Targets Processed',
                    :unit => '',
                    :default_value => 0.0)
type_total_time = DataItemType.create(:name => 'Total Time',
                    :unit => 'ms',
                    :default_value => 0.0)
type_instance_count = DataItemType.create(:name => 'Instance Count',
                    :unit => '',
                    :default_value => 0.0)
type_belt_velocity = DataItemType.create(:name => 'Belt Velocity',
                    :unit => '',
                    :default_value => 0.0)
type_instantaneous_ppm = DataItemType.create(:name => 'Instantaneous Instances Per Minute',
                    :unit => '',
                    :default_value => 0.0)
type_instances_per_minute = DataItemType.create(:name => 'Instances Per Minute',
                    :unit => '',
                    :default_value => 0.0)
type_active_instances = DataItemType.create(:name => 'Active Instances',
                    :unit => '',
                    :default_value => 0.0)
type_latch_faults = DataItemType.create(:name => 'Latch Faults',
                    :unit => '',
                    :default_value => 0.0)
type_avg_allocation_time = DataItemType.create(:name => 'Average Allocation Time',
                    :unit => 'ms',
                    :default_value => 0.0)

# Statistics Entry
puts 'Creating statistics_entry'
stat_entry = StatisticsEntry.create(:process_manager_id => process_manager.id,
                                    :timestamp => DateTime.now.utc)

# Data Item
puts 'Creating data_items'

# Process Manager Data Items
DataItem.create(:data_item_type_id => type_idle_time.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 2.17,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_processing_time.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 97.83,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_average_total_time.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 4117850,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_per_minute.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 124.83,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_per_minute.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 124.77,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_not_processed.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 14345.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_not_processed.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 51701.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_processed.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 8567.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_processed.id,
                :statistics_source_id => pm.id).data_item_values.create(:current_value => 8563.0,
                                                                  :statistics_entry_id => stat_entry.id)

# Robot 1 Data Items
DataItem.create(:data_item_type_id => type_idle_time.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 3.51,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_processing_time.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 96.49,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_total_time.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 4119910.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_per_minute.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 39.8,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_per_minute.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 39.79,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_not_processed.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 10358.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_not_processed.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 21056.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_processed.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 2733.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_processed.id,
                :statistics_source_id => robot_1.id).data_item_values.create(:current_value => 2732.0,
                                                                  :statistics_entry_id => stat_entry.id)

# Front Belt Data Items
DataItem.create(:data_item_type_id => type_instance_count.id,
                :statistics_source_id => front_belt.id).data_item_values.create(:current_value => 49713.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_belt_velocity.id,
                :statistics_source_id => front_belt.id).data_item_values.create(:current_value => 200.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_instantaneous_ppm.id,
                :statistics_source_id => front_belt.id).data_item_values.create(:current_value => 714.21,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_instances_per_minute.id,
                :statistics_source_id => front_belt.id).data_item_values.create(:current_value => 722.33,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_active_instances.id,
                :statistics_source_id => front_belt.id).data_item_values.create(:current_value => 38.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_latch_faults.id,
                :statistics_source_id => front_belt.id).data_item_values.create(:current_value => 0.0,
                                                                  :statistics_entry_id => stat_entry.id)


# Robot 2 Data Items
DataItem.create(:data_item_type_id => type_idle_time.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 0.82,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_processing_time.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 99.18,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_total_time.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 4115800.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_per_minute.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 85.05,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_per_minute.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 85.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_not_processed.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 3987.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_not_processed.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 30645.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_parts_processed.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 5834.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_targets_processed.id,
                :statistics_source_id => robot_2.id).data_item_values.create(:current_value => 5831.0,
                                                                  :statistics_entry_id => stat_entry.id)

# Rear Belt Data Items
DataItem.create(:data_item_type_id => type_instance_count.id,
                :statistics_source_id => rear_belt.id).data_item_values.create(:current_value => 37304.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_belt_velocity.id,
                :statistics_source_id => rear_belt.id).data_item_values.create(:current_value => 150.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_instantaneous_ppm.id,
                :statistics_source_id => rear_belt.id).data_item_values.create(:current_value => 565.42,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_instances_per_minute.id,
                :statistics_source_id => rear_belt.id).data_item_values.create(:current_value => 542.03,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_active_instances.id,
                :statistics_source_id => rear_belt.id).data_item_values.create(:current_value => 50.0,
                                                                  :statistics_entry_id => stat_entry.id)
DataItem.create(:data_item_type_id => type_latch_faults.id,
                :statistics_source_id => rear_belt.id).data_item_values.create(:current_value => 0.0,
                                                                  :statistics_entry_id => stat_entry.id)

# Process Strategy Items
DataItem.create(:data_item_type_id => type_avg_allocation_time.id,
                :statistics_source_id => ps.id).data_item_values.create(:current_value => 1.0,
                                                                  :statistics_entry_id => stat_entry.id)


class CreateStatisticsSourceTypes < ActiveRecord::Migration
  def change
    create_table :statistics_source_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

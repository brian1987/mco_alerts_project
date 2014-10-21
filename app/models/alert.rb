class Alert < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      alert = Alert.create! row.to_hash
      alert.save!
    end
  end
end

#Need to figure out how to persist to DB

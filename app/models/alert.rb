class Alert < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Alert.create! row.to_hash
    end
  end
end

class Alert < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      alert = Alert.create! row.to_hash
      alert.save!
    end
  end


  # Should I create a new model to send alert message? Text below establishes
  # connection w/ Stagin in GSI
  # client = Savon.client(wsdl: "https://staging.gsihealth.com:8083/NotificationManager-1.0/NotificationConsumer?wsdl")
  # <Savon::Client:0x000001040d5840 @globals=#<Savon::GlobalOptions:0x000001040d5818 
  # @option_type=:global, @options={:encoding=>"UTF-8", :soap_version=>1, 
  # :namespaces=>{}, :logger=>#<Logger:0x000001040d5778 @progname=nil, 
  # @level=0, @default_formatter=#<Logger::Formatter:0x000001040d56d8 
  # @datetime_format=nil>, @formatter=nil, @logdev=#<Logger::LogDevice:0x000001040d5688 @shift_size=nil, 
  # @shift_age=nil, @filename=nil, @dev=#<IO:/dev/null>, @mutex=#<Logger::LogDevice::LogDeviceMutex:0x000001040d5638 
  # @mon_owner=nil, @mon_count=0, @mon_mutex=#<Mutex:0x000001040d55e8>>>>, 
  # :log=>true, :filters=>[], :pretty_print_xml=>false, :raise_errors=>true, 
  # :strip_namespaces=>true, :convert_response_tags_to=>
  # <Proc:0x000001040d5548@/usr/local/rvm/gems/ruby-2.0.0-p353/gems/savon-2.3.3/lib/savon/options.rb:56 (lambda)>, 
  # :multipart=>false, :wsdl=>"https://staging.gsihealth.com:8083/NotificationManager-1.0/NotificationConsumer?wsdl"}>, 
  # @wsdl=#<Wasabi::Document:0x000001040d5160 @document="https://staging.gsihealth.com:8083/NotificationManager-1.0/NotificationConsumer?wsdl", 
  # @request=#<HTTPI::Request:0x000001040d5070>>> 



  #Go back to the railscast
  #Above worked just to import CSV
  #how am i going to send this stuff
  #Testing new import method below
  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #       row = Hash[[header, spreadsheet.row(i)].transpose]
  #       product = find_by_id(row["id"]) || new
  #       product.attributes = row.to_hash.slice(*accessible_attributes)
  #       product.save!
  #   end
  # end

  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when ".csv" then Csv.new(file.path, nil, :ignore)
  #   when ".xls" then Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end
end

#Need to figure out how to persist to DB

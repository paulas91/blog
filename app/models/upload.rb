require 'csv'
class Upload < ApplicationRecord
  has_one_attached :file
  has_many :measurements, dependent: :destroy
  has_many :measurement_values, through: :measurements

  # before_create do
  #   self.state = "new"
  # end - metoda na przypisanie wartosci do atrybutu , ta metoda to callback która ma wiele zastosowan

  def process_file
    return if state != "new"

    update(state: 'processing')    
    #wczytaj plik z aktiv storage, w pętli dla każdego rekordu zapisac mesurement i mesurement_value
    csv = CSV.parse(file.download, headers: true, col_sep: "\t") 
    # compact czysci nile w array
    
    measurements_array = csv.headers.compact.map do |header|
      measurements.find_or_create_by(name: header.encode)
    end

    ActiveRecord::Base.transaction do
      csv.each do |row|
        # CSV::Row.to_a
        # [ ['time', '11:11:11'],['Napięcie aku', '14,1']...[nil, nil] ]

        time = row.delete(0)[1]
        row.each do |header, value|
          next if header.nil? || value.nil?
        
          measurement = measurements_array.find { |m| m.name == header.encode }
          # MeasurementValue.create(value: value.to_f, measurement_time: time, measurement_id: measurement.id)
          measurement.measurement_values.create(value: value.to_f, measurement_time: time)
        end
        # self.measurement.measurement_values
      end 
    end
    self.update(state: 'processed') 
  end
end

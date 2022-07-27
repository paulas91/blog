class MeasurementsController < ApplicationController
  def index
    @upload = Upload.find(params[:upload_id])
    @measurements = @upload.measurements
  end

  def show
    @upload = Upload.find(params[:upload_id])
    @measurement = @upload.measurements.find(params[:id])
    @measurement_values = @measurement.measurement_values.page(params[:page])
    @additional_measurements_list = @upload.measurements.reject{ |a| a.id == @measurement.id }.map{|a|[a.name, a.id]}  
    chart_data = @measurement_values.map { |mv| [mv.measurement_time, mv.value] }
    @data = [
      { name: @measurement.name, data: chart_data }
    ]
    if params[:additional_measurement_id].present?
      @additional_measurement = @upload.measurements.find(params[:additional_measurement_id])
      @additional_measurement_values = @additional_measurement.measurement_values.page(params[:page])
      additional_chart_data = @additional_measurement_values.map { |mv| [mv.measurement_time, mv.value] }
      @data << { name: @additional_measurement.name, data: additional_chart_data }
    end
  end 
end
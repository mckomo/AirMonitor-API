class StationSerializer < ActiveModel::Serializer

  attributes :id, :code, :name, :latitude, :longitude, :latest_measurements, :created_at, :updated_at

  def latest_measurements
    object.measurements.latest.map { |m| MeasurementPreviewSerializer.new(m).attributes }
  end

  belongs_to :user,serializer: UserPreviewSerializer, key: 'creator'

end

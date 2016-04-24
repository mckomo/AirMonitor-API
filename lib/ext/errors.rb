class ActiveRecord::RecordNotFound

  include Serializable
  include Identifiable

  identify_by_code 404

end

class ActionController::RoutingError

  include Serializable
  include Identifiable

  identify_by_code 404

end

class ActionController::ParameterMissing

  include Serializable
  include Identifiable

  identify_by_code 400

end
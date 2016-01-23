module Refinements
  module TimeWithZoneRefinements

    refine ActiveSupport::TimeWithZone do

      def around(time_span)
        time - time_span .. time + time_span
      end

    end

  end
end
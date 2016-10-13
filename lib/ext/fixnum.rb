# frozen_string_literal: true
module FixnumRefinements
  refine Integer do
    def fit(range)
      self > range.max ? range.max : (self < range.min ? range.min : self)
    end
  end
end

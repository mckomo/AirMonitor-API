module FixnumRefinements

  refine Fixnum do
    def fit(range)
      self > range.max ? range.max : (self < range.min ? range.min : self)
    end
  end

end
require 'rails_helper'

RSpec.describe Reading, :type => :model do

  let(:norm) { Norm.first }

  subject(:reading) { Reading.create(value: 100, subject_code: norm.subject_code ) }

  it 'has norms' do
    expect(reading.subject.norms).not_to be_empty
  end

end

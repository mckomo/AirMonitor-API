require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { create(:user) }

  it 'is inactive by default' do
    expect(subject.active?).to be(false)
  end

  describe '.activate' do

    it 'changes user status to active' do
      subject.activate
      expect(subject.status).to eq('active')
    end

  end

  describe '.delete' do

    it 'changes user status to deleted' do
      subject.delete
      expect(subject.status).to eq('deleted')
    end

  end

end

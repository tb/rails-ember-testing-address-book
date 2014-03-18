require 'spec_helper'

describe PhoneNumber do
  describe '#create' do
    subject { build(:phone_number, contact: build(:contact)) }

    it { expect{subject.save}.to change{PhoneNumber.count}.by(1) }
  end
end

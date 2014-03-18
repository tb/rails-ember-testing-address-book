require 'spec_helper'

describe Contact do
  subject { build(:contact) }

  it { should be_valid }

  describe '#create' do
    subject { build(:contact) }

    it { expect{subject.save}.to change{Contact.count}.by(1) }

    context 'with phone numbers' do
      subject { build(:contact, phone_numbers: build_list(:phone_number, 2)) }

      it { expect{subject.save}.to change{PhoneNumber.count}.by(2) }
    end
  end
end

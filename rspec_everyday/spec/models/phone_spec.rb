require 'spec_helper'

describe Phone do

  it "it does not allow duplicate phone numbers per contact" do
    contact = FactoryGirl.create(:contact) # koristi ga u drugim obj

    FactoryGirl.create(:home_phone, contact: contact, phone: '123-456')
    mobile_phone = FactoryGirl.build(:mobile_phone, contact: contact, phone: '123-456')

    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it "allows two contacts to share a same phone number" do
    FactoryGirl.create(:home_phone, phone: "123-456")

    expect(FactoryGirl.build(:home_phone, phone: '123-456')).to be_valid
  end
end


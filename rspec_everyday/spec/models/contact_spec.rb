require 'spec_helper'

describe Contact do

  it "is valid with a firstname, lastname and email" do
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  it "is invalid without a firstname" do
    contact = FactoryGirl.build(:contact, firstname: nil)
    expect(contact).to have(1).errors_on(:firstname)
  end

  it "is invalid without a lastname" do
    contact = FactoryGirl.build(:contact, lastname: nil)
    expect(contact).to have(1).errors_on(:lastname)
  end

  it "is invalid without an email address" do
    contact = FactoryGirl.build(:contact, email: nil)
    expect(contact).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:contact, email: 'tester@exm.com')
    contact = FactoryGirl.build( :contact, email: 'tester@exm.com' )

    expect(contact).to have(1).errors_on(:email)
  end

  it "returns a contact's full name as a string" do
    contact = FactoryGirl.build(:contact, firstname: 'John', lastname: 'Doe', email: 'jd@mail.com')

    expect(contact.name).to eq 'John Doe'
  end

  it "has three phone numbers" do
    expect(FactoryGirl.create(:contact).phones.count).to eq 3
  end

  describe "filter last name by letter" do
    before :each do
      @smith = FactoryGirl.create(:contact, firstname: 'John', lastname: 'Smith', email: 'js@example.com')
      @jones = FactoryGirl.create(:contact, firstname: 'Tim', lastname: 'Jones', email: 'tj@example.com')
      @johnson = FactoryGirl.create(:contact, firstname: 'John', lastname: 'Johnson', email: 'jj@example.com')
    end

    context "matching letters" do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("J")).to eq [@johnson, @jones] # obj su u array
      end
    end

    context "non-matching letters" do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("J")).to_not include @smith
      end
    end
  end



end

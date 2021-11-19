require 'rails_helper'

RSpec.describe User, type: :model do
  subject{User.create(email: "example@example.com", password:"123456789")}

  context "at creation" do

    it "should save correctly with correct params" do
      subject.email = "example2@example2.com"
      subject.password = "123456"
      expect(subject).to be_valid
    end

    it "should have an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "email should be unique" do
      subject.email = User.last.email
      expect(subject).to_not be_valid
    end
    
    it "email should be maximum 255 chars" do
      subject.email = "a" * 255  + "@lipsum.com"
      expect(subject).to_not be_valid
    end

    it "email should have email-format" do
      subject.email = "example"
      expect(subject).to_not be_valid
    end

    it "should have a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "password should be at least 6 character length" do
      subject.password = "123"
      expect(subject).to_not be_valid
    end

  end

end

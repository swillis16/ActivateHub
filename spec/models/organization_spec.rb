require 'spec_helper'

describe Organization do
  subject(:organization) { build(:organization) }

  # Tests for Organization:
  # - Creating an organization with 'viagra' as name should fail.
  # - Creating an organization without a name is not possible.
  # - If the email is included, it should be valid

  it { should be_valid }

  describe "in general" do
    before(:each) do
      @org = Organization.new(:name => "My Organization", :contact_name => "Juana", :email => "juana@myorganization.org")
    end
    specify {@org.should be_valid}
  end

  describe "when creating nameless organizations" do
    before(:each) do
      @org = Organization.new()
    end
    specify {@org.should_not be_valid}
  end

  describe "when creating spam" do
    before(:each) do
      @org = Organization.new(:name => "Some like viagra")
    end

    specify {@org.should_not be_valid}
  end

  describe "when adding email" do
    before(:each) do
      @org = Organization.new(:name => "Awsome Organization", :email => "juana is not awsome")
    end
    specify {@org.should_not be_valid}
  end

end

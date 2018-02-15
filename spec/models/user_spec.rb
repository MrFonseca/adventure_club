RSpec.describe User, type: :model do
  subject { described_class.new(FactoryBot.attributes_for(:user)) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "#role" do
      it "is not valid with empty role" do
        subject.role = ""
        expect(subject).to be_invalid
        expect(subject.errors[:role]).to be_present
      end
    end

    describe "#email" do
      it "is not valid with empty email" do
        subject.email = ""
        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end

      it "is not valid with invalid format" do
        subject.email = "invalid_format"
        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end

      it "is not valid with matching email" do
        FactoryBot.create(:user, email: "user@user.com")
        subject.email = "user@user.com"
        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end
    end

    describe "#registration_date" do
      it "is not valid with empty registration_date" do
        subject.registration_date = ""
        expect(subject).to be_invalid
        expect(subject.errors[:registration_date]).to be_present
      end
    end
  end

  describe "callbacks" do
    context "before_validation" do
      it "coverts e-mail to lowercase" do
        subject.email = "USER@uSEr.com"
        subject.save
        expect(subject.email).to eq("user@user.com")
      end
    end
  end
end

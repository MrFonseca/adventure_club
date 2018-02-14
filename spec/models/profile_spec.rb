RSpec.describe Profile, type: :model do
  subject { FactoryBot.build(:profile) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "#name" do
      it "is not valid with empty name" do
        subject.name = ""
        expect(subject).to be_invalid
        expect(subject.errors[:name]).to be_present
      end

      it "is not valid with digit character" do
        subject.name = "123 de Oliveira 4"
        expect(subject).to be_invalid
        expect(subject.errors[:name]).to be_present
      end
    end

    describe "#cbo" do
      it "is valid with empty cbo" do
        subject.cbo = ""
        expect(subject).to be_valid
      end

      it "is not valid without integer value" do
        subject.cbo = "erro"
        expect(subject).to be_invalid
        expect(subject.errors[:cbo]).to be_present
      end

      it "is not valid with decimal value" do
        subject.cbo = 2001.1
        expect(subject).to be_invalid
        expect(subject.errors[:cbo]).to be_present
      end

      it "is not valid with matching cbo" do
        FactoryBot.create(:profile, cbo: 666)
        subject.cbo = 666
        expect(subject).to be_invalid
        expect(subject.errors[:cbo]).to be_present
      end
    end

    describe "#document" do
      it "is not valid with empty document" do
        subject.document = ""
        expect(subject).to be_invalid
        expect(subject.errors[:document]).to be_present
      end

      it "is not valid without integer value" do
        subject.document = "erro"
        expect(subject).to be_invalid
        expect(subject.errors[:document]).to be_present
      end

      it "is not valid with decimal value" do
        subject.document = 2001.1
        expect(subject).to be_invalid
        expect(subject.errors[:document]).to be_present
      end

      it "is not valid with matching document" do
        FactoryBot.create(:profile, document: 666)
        subject.document = 666
        expect(subject).to be_invalid
        expect(subject.errors[:document]).to be_present
      end
    end

    describe "#blood_type" do
      it "is valid with empty blood type" do
        subject.blood_type = ""
        expect(subject).to be_valid
      end
    end

    describe "#address" do
      it "is not valid with empty address" do
        subject.address = ""
        expect(subject).to be_invalid
        expect(subject.errors[:address]).to be_present
      end
    end

    describe "#city" do
      it "is not valid with empty city" do
        subject.city = ""
        expect(subject).to be_invalid
        expect(subject.errors[:city]).to be_present
      end
    end

    describe "#phone_number" do
      it "is not valid with empty phone_number" do
        subject.phone_number = ""
        expect(subject).to be_invalid
        expect(subject.errors[:phone_number]).to be_present
      end

      it "is not valid without integer value" do
        subject.phone_number = "erroerroerr"
        expect(subject).to be_invalid
        expect(subject.errors[:phone_number]).to be_present
      end

      it "is not valid with matching phone_number" do
        FactoryBot.create(:profile, phone_number: "75999888666")
        subject.phone_number = "75999888666"
        expect(subject).to be_invalid
        expect(subject.errors[:phone_number]).to be_present
      end

      it "is valid only with 11 digits" do
        subject.phone_number = "999000111"
        expect(subject).to be_invalid
        expect(subject.errors[:phone_number]).to be_present
      end
    end
  end
end

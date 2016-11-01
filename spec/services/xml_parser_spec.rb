require 'rails_helper'

RSpec.describe XmlParser do
  describe "parse! method should parse the given document" do
    let(:file_name) do
      # 'spec/fixtures/purchaseNotice_Adygeya_Resp_20130301_000000_20130401_235959_001.xml'
      'spec/fixtures/fcsNotificationZP44_9911111111314001000_14514.xml'
    end

    let(:parser_object) { XmlParser.new(file_name) }
    let(:purchase_attributes) { build(:purchase) }
    let(:contact_attributes) { build(:contact) }
    let(:customer_attributes) { build(:organization) }
    let(:attachment_attributes) { build(:attachment) }
    let(:lot_attributes) { build(:lot) }
    let(:lot_item_attributes) { build(:lot_item) }

    context 'Create new Purchase. Is not nested' do
      it 'count +1 in the database' do
        expect{ parser_object.parse! }.to change(Purchase, :count).by(1)
      end

      describe 'fields are correct' do
        before(:each) { parser_object.parse! }

        it "correct guid" do
          expect(purchase_attributes["guid"]).to eq(Purchase.last.guid)
        end

        it "correct create_date_time" do
          expect(purchase_attributes["create_date_time"]).to eq(Purchase.last.create_date_time)
        end

        it "correct registration_number" do
          expect(purchase_attributes["registration_number"]).to eq(Purchase.last.registration_number)
        end

        it "correct name" do
          expect(purchase_attributes["name"]).to eq(Purchase.last.name)
        end

        it "correct purchase_method_code" do
          expect(purchase_attributes["purchase_method_code"]).to eq(Purchase.last.purchase_method_code)
        end

        it "correct purchase_code_name" do
          expect(purchase_attributes["purchase_code_name"]).to eq(Purchase.last.purchase_code_name)
        end

        it "correct publication_date_time" do
          expect(purchase_attributes["publication_date_time"]).to eq(Purchase.last.publication_date_time)
        end

        it "correct modification_date" do
          expect(purchase_attributes["modification_date"]).to eq(Purchase.last.modification_date)
        end

        it "correct status" do
          expect(purchase_attributes["status"]).to eq(Purchase.last.status)
        end

        it "correct version" do
          expect(purchase_attributes["version"]).to eq(Purchase.last.version)
        end

        it "correct save_user_id" do
          expect(purchase_attributes["save_user_id"]).to eq(Purchase.last.save_user_id)
        end

        it "correct examination_place" do
          expect(purchase_attributes["examination_place"]).to eq(Purchase.last.examination_place)
        end

        it "correct examination_date_time" do
          expect(purchase_attributes["examination_date_time"]).to eq(Purchase.last.examination_date_time)
        end

        it "correct submission_close_date_time" do
          expect(purchase_attributes["submission_close_date_time"]).to eq(Purchase.last.submission_close_date_time)
        end

        it "correct publication_planned_date" do
          expect(purchase_attributes["publication_planned_date"]).to eq(Purchase.last.publication_planned_date)
        end
      end
    end

    context 'Create new Customer. 1 lvl nested. belongs to.' do
      it 'count increased in the database' do
        expect{ parser_object.parse! }.to change(Organization, :count)
      end

      it 'association exists' do
        parser_object.parse!
        customer = Organization.find_by(inn: customer_attributes[:inn])
        expect(Purchase.last.customer).to eq(customer)
      end

      describe 'fields are correct' do
        before(:each) do
          parser_object.parse!
          @customer = Purchase.last.customer
        end

        it "correct full_name" do
          expect(customer_attributes["full_name"]).to eq(@customer.full_name)
        end

        it "correct short_name" do
          expect(customer_attributes["short_name"]).to eq(@customer.short_name)
        end

        it "correct inn" do
          expect(customer_attributes["inn"]).to eq(@customer.inn)
        end

        it "correct kpp" do
          expect(customer_attributes["kpp"]).to eq(@customer.kpp)
        end

        it "correct ogrn" do
          expect(customer_attributes["ogrn"]).to eq(@customer.ogrn)
        end

        it "correct legal_address" do
          expect(customer_attributes["legal_address"]).to eq(@customer.legal_address)
        end

        it "correct postal_address" do
          expect(customer_attributes["postal_address"]).to eq(@customer.postal_address)
        end

        it "correct phone" do
          expect(customer_attributes["phone"]).to eq(@customer.phone)
        end

        it "correct email" do
          expect(customer_attributes["email"]).to eq(@customer.email)
        end

        it "correct okato" do
          expect(customer_attributes["okato"]).to eq(@customer.okato)
        end
      end
    end

    context 'Create new Contact. 2 lvl nesed with Organization. belongs to.' do
      it 'count +1 in the database' do
        expect{ parser_object.parse! }.to change(Contact, :count).by(1)
      end

      it 'association exists' do
        parser_object.parse!
        contact = Contact.find_by(email: contact_attributes.email)
        expect(Purchase.last.contact).to eq(contact)
      end

      describe 'fields are correct' do
        before(:each) do
          parser_object.parse!
          @contact = Purchase.last.contact
        end

        it "correct first_name" do
          expect(contact_attributes["first_name"]).to eq(@contact.first_name)
        end

        it "correct middle_name" do
          expect(contact_attributes["middle_name"]).to eq(@contact.middle_name)
        end

        it "correct last_name" do
          expect(contact_attributes["last_name"]).to eq(@contact.last_name)
        end

        it "correct phone" do
          expect(contact_attributes["phone"]).to eq(@contact.phone)
        end

        it "correct fax" do
          expect(contact_attributes["fax"]).to eq(@contact.fax)
        end

        it "correct email" do
          expect(contact_attributes["email"]).to eq(@contact.email)
        end

        context "nested organization is correct" do
          it "correct full_name" do
            expect(contact_attributes.organization.full_name).to eq(@contact.organization.full_name)
          end

          it "correct short_name" do
            expect(contact_attributes.organization.short_name).to eq(@contact.organization.short_name)
          end

          it "correct inn" do
            expect(contact_attributes.organization.inn).to eq(@contact.organization.inn)
          end

          it "correct kpp" do
            expect(contact_attributes.organization.kpp).to eq(@contact.organization.kpp)
          end

          it "correct ogrn" do
            expect(contact_attributes.organization.ogrn).to eq(@contact.organization.ogrn)
          end

          it "correct legal_address" do
            expect(contact_attributes.organization.legal_address).to eq(@contact.organization.legal_address)
          end

          it "correct postal_address" do
            expect(contact_attributes.organization.postal_address).to eq(@contact.organization.postal_address)
          end

          it "correct phone" do
            expect(contact_attributes.organization.phone).to eq(@contact.organization.phone)
          end

          it "correct email" do
            expect(contact_attributes.organization.email).to eq(@contact.organization.email)
          end

          it "correct okato" do
            expect(contact_attributes.organization.okato).to eq(@contact.organization.okato)
          end
        end
      end
    end

    context 'Create new Attachments. 1 lvl nested. has_many' do
      it 'count increased in the database' do
        expect{ parser_object.parse! }.to change(Attachment, :count).by(3)
      end

      it 'association exists' do
        parser_object.parse!
        expect(Purchase.last.attachments).not_to be_nil
      end

     describe 'fields are correct' do
        before(:each) do
          parser_object.parse!
          @attachment = Purchase.last.attachments.first
        end

        it "correct guid" do
          expect(attachment_attributes["guid"]).to eq(@attachment.guid)
        end

        it "correct create_date_time" do
          expect(attachment_attributes["create_date_time"]).to eq(@attachment.create_date_time)
        end

        it "correct file_name" do
          expect(attachment_attributes["file_name"]).to eq(@attachment.file_name)
        end

        it "correct description" do
          expect(attachment_attributes["description"]).to eq(@attachment.description)
        end

        it "correct url" do
          expect(attachment_attributes["url"]).to eq(@attachment.url)
        end
      end
    end

    context 'Create new Lots. 4 lvl nested. has_many with inner has_many lot items.' do
      it 'count +1 in the database' do
        expect{ parser_object.parse! }.to change(Lot, :count).by(1)
      end

      it 'association exists' do
        parser_object.parse!
        expect(Purchase.last.lots).not_to be_nil
      end

      describe 'fields are correct' do
        before(:each) do
          parser_object.parse!
          @lot = Purchase.last.lots.first
        end

        it "correct guid" do
          expect(lot_attributes["guid"]).to eq(@lot.guid)
        end

        it "correct ordinal_number" do
          expect(lot_attributes["ordinal_number"]).to eq(@lot.ordinal_number)
        end

        it "correct subject" do
          expect(lot_attributes["subject"]).to eq(@lot.subject)
        end

        it "correct initial_sum" do
          expect(lot_attributes["initial_sum"]).to eq(@lot.initial_sum)
        end

        it "correct delivery_place" do
          expect(lot_attributes["delivery_place"]).to eq(@lot.delivery_place)
        end

        it "currency is not nil" do
          expect(@lot.currency).not_to be_nil
        end

        context "nested lot_item is correct" do
          before(:each) do
            @lot_item = @lot.lot_items.first
          end

          it "correct guid" do
            expect(lot_attributes["guid"]).to eq(@lot_item.guid)
          end

          it "correct ordinal_number" do
            expect(lot_item_attributes["ordinal_number"]).to eq(@lot_item.ordinal_number)
          end

          it "correct qty" do
            expect(lot_item_attributes["qty"]).to eq(@lot_item.qty)
          end

          it "okdp not nil" do
            expect(@lot_item.okdp).not_to be_nil
          end

          it "okved not nil" do
            expect(@lot_item.okved).not_to be_nil
          end

          it "okei not nil" do
            expect(@lot_item.okei).not_to be_nil
          end
        end
      end
    end
  end
end

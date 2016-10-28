require 'rails_helper'

RSpec.describe AbstractXmlParser do
  describe "parse! method should parse the given document" do
    let(:file_name) do
      'public/unzip_files/purchaseNotice_Adygeya_Resp_20130301_000000_20130401_235959_001.xml'
    end

    let(:attributes) { build(:purchase) }

    before(:each) do
      parser_object = AbstractXmlParser.new(file_name)
      @model_object = parser_object.parse!
    end

    it "should parse Purchase document" do
      expect(attributes["guid"]).to eq(@model_object.guid)
    end
    it "should parse Purchase document" do
      expect(attributes["create_date_time"]).to eq(@model_object.create_date_time)
    end
    it "should parse Purchase document" do
      expect(attributes["registration_number"]).to eq(@model_object.registration_number)
    end
    it "should parse Purchase document" do
      expect(attributes["name"]).to eq(@model_object.name)
    end
    it "should parse Purchase document" do
      expect(attributes["purchase_method_code"]).to eq(@model_object.purchase_method_code)
    end
    it "should parse Purchase document" do
      expect(attributes["purchase_code_name"]).to eq(@model_object.purchase_code_name)
    end
    it "should parse Purchase document" do
      expect(attributes["publication_date_time"]).to eq(@model_object.publication_date_time)
    end
    it "should parse Purchase document" do
      expect(attributes["modification_date"]).to eq(@model_object.modification_date)
    end
    it "should parse Purchase document" do
      expect(attributes["status"]).to eq(@model_object.status)
    end
    it "should parse Purchase document" do
      expect(attributes["version"]).to eq(@model_object.version)
    end
    it "should parse Purchase document" do
      expect(attributes["save_user_id"]).to eq(@model_object.save_user_id)
    end
    it "should parse Purchase document" do
      expect(attributes["examination_place"]).to eq(@model_object.examination_place)
    end
    it "should parse Purchase document" do
      expect(attributes["examination_date_time"]).to eq(@model_object.examination_date_time)
    end
    it "should parse Purchase document" do
      expect(attributes["submission_close_date_time"]).to eq(@model_object.submission_close_date_time)
    end
    it "should parse Purchase document" do
      expect(attributes["publication_planned_date"]).to eq(@model_object.publication_planned_date)
    end
  end
end

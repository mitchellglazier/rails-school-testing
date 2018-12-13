require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # let(:valid_attributes) {
  #   { 
  #     school_id: null,
  #     name: 'Bob', 
  #     student_number: 123, 
  #     gpa: 3.0
  #   }
  # }

  # let(:invalid_attributes) {
  #   { 
  #     school_id: "hello",
  #     name: '', 
  #     student_number: '100', 
  #     gpa: 5 
  #   }
  # }

  before(:all) do
    @school = FactoryBot.create(:school)
    @student = FactoryBot.create(:student, school_id: @school.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { school_id: @school.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { school_id: @school.id, id: @student.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { school_id: @school.id, id: @student.id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { school_id: @school.id, id: @student.id}
      expect(response).to be_successful
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student" do
      expect {
        delete :destroy, params: { school_id: @school.id, id: @student.id}
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the school list" do
      delete :destroy, params: { school_id: @school.id, id: @student.id}
      expect(response).to redirect_to(student_url)
    end
  end


end

require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'attributes' do
    it 'has a name' do
      name = 'Bob'
      student = Student.create(name: name)
      expect(student.name).to eq(name)
    end

    it 'has a school id' do
      school_id = 123
      student = Student.create(school_id: school_id)
      expect(student.school_id).to eq(school_id)
    end

    it 'has a student number' do
      student_number = 123
      student = Student.create(student_number: student_number)
      expect(student.student_number).to eq(student_number)
    end

    it 'has a gpa' do
      gpa = 4.0
      student = Student.create(gpa: gpa)
      expect(student.gpa).to eq(gpa)
    end
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :school_id }
    it { should validate_presence_of :student_number }
    it { should validate_presence_of :gpa }
    
    it 'has a gpa of at least 0.0' do
      should validate_numericality_of(:gpa).
      is_greater_than_or_equal_to(0.0)
    end

    it 'as a gpa less than 4.0' do
      should validate_numericality_of(:gpa).
      is_less_than_or_equal_to(4.0)
    end
  end

  describe "association" do
    it { should belong_to(:school) }
  end

  describe "uniqueness" do
    Student.create(name: "Bob", student_number: 123, gpa: 4.0, school_id: 1)
    subject { Student.new(name: "Bob", student_number: 123, gpa: 4.0, school_id: 1) }  
    # it { should validate_uniqueness_of(:student_number).ignoring_case_sensitivity }

    describe "validations" do
      subject { Student.create(student_number: 123) }
      # it { should validate_uniqueness_of(:student_number).ignoring_case_sensitivity }
    end
  end

  describe "numericality" do
    before(:each) do
      @gpa = Student.create(name: 'foo', student_number: '123', gpa: 2.0)
    end
    
     it { should validate_numericality_of(:gpa) }
  end 
end 
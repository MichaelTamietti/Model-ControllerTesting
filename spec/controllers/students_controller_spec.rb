require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Write your test below
  # it will be easier to test this controller with factory bot
    # you would have to add the gem and configure it.

  let(:school) {FactoryBot.create(:school)}
  
  let(:good_student) { FactoryBot.create(:student) }
  let(:bad_student) { FactoryBot.create(:student, name: 'Evil Bob', gpa: -2)}
  

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { school_id: school.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      student = good_student
      get :show, params: { school_id: school.id, student_id: student.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { school_id: school.id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      school = School.create! valid_attributes
      get :edit, params: { school_id: school.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new student" do
        expect {
          post :create, params: { student: good_student }
        }.to change(Student, :count).by(1)
      end

      it "redirects to the created student" do
        post :create, params: { student: good_student }
        expect(response).to redirect_to(Student.last)
      end
    end

     context "with invalid params" do
      it "does not creates a new student" do
        expect {
          post :create, params: { student: bad_student }
        }.to change(Student, :count).by(0)
      end

      it "redirects to new template" do
        post :create, params: { }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { capacity: 250 }
      }

      it "update the school" do
        school = School.create! valid_attributes
        put :update, params: {id: school.id, school: new_attributes }
        school.reload
        expect(school.capacity).to eq(new_attributes[:capacity])
      end

      it "redirect to the school updated" do
        school = School.create! valid_attributes
        put :update, params: {id: school.id, school: valid_attributes }
        expect(response).to redirect_to(school)
      end
    end

    context "with invalid params" do
      it "does not update the school" do
        school = School.create! valid_attributes
        put :update, params: {id: school.id, school: invalid_attributes }
        school.reload
        expect(school.name).to_not eq(invalid_attributes[:name])
      end

      it "redirect to the edit form" do
        school = School.create! valid_attributes
        put :update, params: {id: school.id, school: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

   describe "DELETE #destroy" do
    it "destroys the requested school" do
      school = School.create! valid_attributes
      expect {
        delete :destroy, params: {id: school.id}
      }.to change(School, :count).by(-1)
    end

    it "redirects to the school list" do
      school = School.create! valid_attributes
      delete :destroy, params: {id: school.id}
      expect(response).to redirect_to(schools_url)
    end
  end

end

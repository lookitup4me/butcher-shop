require 'spec_helper'

describe CutsController do
  let(:cut_attrs)     { { :format => :json, :cut => attributes_for(:cut) } }
  let(:bad_cut_attrs) { { :format => :json, :cut => { :name => nil } } }
  subject                { response }

  context "existing cut" do
    let!(:cut)      { create :cut }
    let(:cut_attrs) { { :id => cut.id, :format => :json, :cut => { :name => "Super Chicken" } } }

    describe "GET 'show'" do
      before(:each) { get :show, :id => cut.id, :format => :json }

      its(:body)    { should_not be_empty }
      its(:status)  { should be 200}

      context "with an unknown cut" do
        before(:each) { get :show, :id => 9999, :format => :json }

        its("body.strip") { should be_empty }
        its(:status)      { should be 404 }
      end
    end

    describe "PUT 'update'" do
      before(:each) { put :update, cut_attrs }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }

      it "updates the cut" do
        Cut.find(cut.id).name.should eq cut_attrs[:cut][:name]
      end

      context "with bad params" do
        before(:each) { put :update, { :id => cut.id, :cut => { :name => nil }, :format => :json } }

        its(:body)    { should_not be_empty }
        its(:status)  { should be 422 }
      end
    end

    describe "DELETE 'destroy'" do
      before(:each) { delete :destroy, :id => cut.id, :format => :json }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }
    end
  end
end

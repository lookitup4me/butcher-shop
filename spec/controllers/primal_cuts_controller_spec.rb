require 'spec_helper'

describe PrimalCutsController do
  let(:primal_cut_attrs)     { { :format => :json, :primal_cut => attributes_for(:primal_cut) } }
  let(:bad_primal_cut_attrs) { { :format => :json, :primal_cut => { :name => "Test" } } }
  subject              { response }


  context "existing primal_cut" do
    let!(:primal_cut)      { create :primal_cut }
    let(:primal_cut_attrs) { { :id => primal_cut.id, :format => :json, :primal_cut => { :name => "Pepperoni" } } }

    describe "GET 'show'" do
      before(:each) { get :show, :id => primal_cut.id, :format => :json }

      its(:body)    { should_not be_empty }
      its(:status)  { should be 200}

      context "with an unknown primal_cut" do
        before(:each) { get :show, :id => 9999, :format => :json }

        its("body.strip") { should be_empty }
        its(:status)      { should be 404 }
      end
    end

   describe "PUT 'update'" do
      before(:each) { put :update, primal_cut_attrs }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }

      it "updates the primal_cut" do
        PrimalCut.find(primal_cut.id).name.should eq primal_cut_attrs[:primal_cut][:name]
      end

      context "with bad params" do
        before(:each) { put :update, { :id => primal_cut.id, :primal_cut => { :name => nil }, :format => :json } }

        its(:body)    { should_not be_empty }
        its(:status)  { should be 422 }
      end
    end


    describe "DELETE 'destroy'" do
      before(:each) { delete :destroy, :id => primal_cut.id, :format => :json }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }
    end
  end
end

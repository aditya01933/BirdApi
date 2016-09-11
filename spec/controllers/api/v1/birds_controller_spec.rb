require 'rails_helper'
require 'pp'
module Api;module V1
  RSpec.describe BirdsController, type: :controller do

    describe "POST /birds" do
      context "with correct params" do
        it "create the specified bird" do
          expect {
            post :create, params: {data:{attributes: FactoryGirl.attributes_for(:bird)}}
          }.to change(Bird, :count).by(1)
          expect(response.status).to eq 201          
        end
      end
      context "with wrong params" do
        it "returns 400 Bad Request" do
          post :create, params: {data: "I am BAD"}
          expect(response).to be_bad_request
          expect(response.status).to eq(400)
        end
      end      
    end

    describe "GET /birds" do
      it "returns all visible birds" do 
        get :index
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        visiblity_status = body.all? {|e| e["visible"] == true}
        expect(body.count).to be > 1
        expect(visiblity_status).to be true
        expect(response.status).to be 200
      end
    end

    describe "GET /birds/{id}" do
      context "when bird found" do
        it "returns the specified bird" do
          bird_id = FactoryGirl.create(:bird).id
          get :show, params: {id: bird_id}
          expect(response.status).to eq 200
          body = JSON.parse(response.body)
          expect(body["id"]).to eq(bird_id.to_s)
        end  
      end
      context "when bird not found" do 
        it "returns 404 not found status" do
          get :show, params: {id: "fake_id"}
          expect(response.status).to eq 404
        end
      end
    end

    describe "DELETE /birds/{id}" do
      context "when bird found" do
        it "delete the specified bird" do
          bird_id = FactoryGirl.create(:bird).id
          delete :destroy, params: {id: bird_id}
          expect(response.status).to eq 200
        end
      end
      context "when bird not found" do 
        it "returns 404 not found status" do
          get :destroy, params: {id: "fake_id"}
          expect(response.status).to eq 404
        end
      end
    end

  end
end;end

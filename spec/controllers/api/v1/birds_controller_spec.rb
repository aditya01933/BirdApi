require 'rails_helper'
module Api;module V1
  RSpec.describe BirdsController, type: :request do

    describe "POST /birds" do
      it "create the specified bird"
    end

    describe "GET /birds" do
      it "returns all birds"
    end

    describe "GET /birds/{id}" do
      it "returns the specified bird"
    end

    describe "DELETE /birds/{id}" do
      it "delete the specified bird"
    end

  end
end;end

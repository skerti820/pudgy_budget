require 'rails_helper'

RSpec.describe Bucket, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:categories) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end

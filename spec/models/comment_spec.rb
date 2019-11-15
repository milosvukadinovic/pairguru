require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column :content }
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :movie_id }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
    
  end
end
require "rails_helper"

describe TopUsers::UsersQuery, type: :query do
  subject { described_class.new(relation, days_amount: days_amount).find_top_users(amount: 4) }

  let(:relation) { User.joins(:comments) }
  let(:days_amount) { 7 }
  let(:user) { create(:user) }
  let(:user1) { create(:user) }

  let!(:comment1) { create(:comment, :with_date, user: user) }
  let!(:comment2) { create(:comment, user: user1) }

  describe "#find_top_users" do
    context "when time limit is set to 7 days" do
      it "finds users" do
        expect(subject).to contain_exactly(user1)
      end
    end

    context "when time limit is set to 14 days" do
      let(:days_amount) { 15 }
      it "finds users in given week amount" do
        expect(subject).to contain_exactly(user1, user)
      end
    end
  end
end
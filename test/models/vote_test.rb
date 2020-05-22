require "test_helper"

describe Vote do
  before do
    @user = User.first
    @work = Work.first
    @vote = Vote.new(work_id: @work.id, user_id: @user.id) 
  end

  describe "Relationship" do
    describe "Vote relationship to Work" do
      it "a vote must be able to call a work by work_id" do
        expect _(@vote.work).must_be_kind_of Work
        expect _(@vote.work.id).must_be :>=,  1
        expect _(@vote.work_id).must_equal @work.id
        expect _(@vote.work.title).must_equal "Greatest Hits"
      end
    end
  
    describe "Vote relationship to User" do   
      it "a vote must be able to call a user by user_id" do
        expect _(@vote.user).must_be_kind_of User
        expect _(@vote.user.id).must_be :>=,  1
        expect _(@vote.user.id).must_equal @user.id
        expect _(@vote.user.username).must_equal "Sandy Beech"
      end
    end
  end
end  
 
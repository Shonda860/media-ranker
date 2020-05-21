require "test_helper"

describe User do
  describe "validations" do
    it "can be instantiated" do
   
      expect users(:user_1).valid?.must_equal true
     end

    it "will have the required fields" do
      users(:user_1).username = nil
      no_username = users(:user_1).valid?
       expect (no_username).must_equal false      
    end
    it "it can advise of errors" do
    
    end
  end

  describe "relationships" do
    before do
      users(:user_1).save
      @new_user = User.first
      @work_1 = works(:eagles)
      @work_2 = works(:kobe)
      @work_3 = works(:wayne)
    end

    it "one user can have many votes on different works" do
      #Arrange
      new_vote_1 = Vote.create(user_id: @new_user.id, work_id: @work_1.id)
      new_vote_2 = Vote.create(user_id: @new_user.id, work_id: @work_2.id)
      new_vote_3 = Vote.create(user_id: @new_user.id, work_id: @work_3.id)
      expect(@new_user.votes.count).must_equal 3
      @new_user.votes.each do |vote|
        expect(vote).must_be_instance_of Vote
      end
    end

    it "one user can not vote on the same works more than once" do
      new_vote_1 = Vote.create(user_id: @new_user.id, work_id: 
      @work_1.id)
      new_vote_2 = Vote.create(user_id: @new_user.id, work_id: @work_1.id)
      expect(@new_user.votes.count).must_equal 1
    end
    it "must have a username" do
      @new_user.username = nil

      expect(@new_user.valid?).must_equal false
    
      expect(@new_user.errors.messages).must_include :username
      expect(@new_user.errors.messages[:username]).must_equal ["can't be blank"]
    end
  end
end



require "test_helper"

describe User do
  let(:new_user){
    User.new(username: "Rose Gardner")
  }

  it "can be instantiated" do
    expect(new_user.valid?).must_equal true
  end

  it "will have the required fields" do
    new_user.save
    user = User.first
    expect(user.username).must_equal "Rose Gardner"      
  end

  describe "relationships" do
    before do
      new_user.save
      new_user = User.first
    end

    it "can have many votes" do
      #Arrange
      work_1 = Work.create(category:"album", title:"Greatest Hits", creator: "Eagles", publication_year: "2000", description: "description")
      work_2 = Work.create(category:"book", title:"The Jordan Story", creator: "Jordan", publication_year: "1980", description: "description")
      work_3 = Work.create(category:"movie", title:"Space Jam", creator: "LBJ", publication_year: "2022", description: "description")
      new_vote_1 = Vote.create(user_id: new_user.id, work_id: work_1.id)
      new_vote_2 = Vote.create(user_id: new_user.id, work_id: work_2.id)
      new_vote_3 = Vote.create(user_id: new_user.id, work_id: work_3.id)
      expect(new_user.votes.count).must_equal 3
      new_user.votes.each do |vote|
        expect(vote).must_be_instance_of Vote
      end
    end
  end

  describe "validations" do 
    it "must have a name" do
      new_user.username = nil

      expect(new_user.valid?).must_equal false
      expect(new_user.errors.messages).must_include :username
      expect(new_user.errors.messages[:username]).must_equal ["can't be blank"]
      
    end
  end
end

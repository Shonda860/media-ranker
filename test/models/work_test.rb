require "test_helper"

describe Work do
   let(:new_work) { Work.new(category:"album", title:"Greatest Hits", creator: "Eagles", publication_year: "2000", description: "description")
   }
  

  describe "validations" do
    before do
      new_work.save
      new_work = Work.first
    end
    it "is valid when all fields are present" do
      valid_works = new_work.valid?

      expect(valid_works).must_equal true
    end

    it "is invalid when work title is NOT present" do
      new_work.title = nil
      expect(new_work.valid?).must_equal false
    end
    it "is invalid when work title is NOT present" do
      new_work.title = nil
      expect(new_work.valid?).must_equal false
    end
  end
 
    it "recieves error if TITLE not present" do
      new_work.title = nil   
    
      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :title
      expect(new_work.errors.messages[:title]).must_equal ["can't be blank"]
  end

  it "recieves error if CREATOR not present" do
    new_work.creator = nil   
  
    expect(new_work.valid?).must_equal false
    expect(new_work.errors.messages).must_include :creator
    expect(new_work.errors.messages[:creator]).must_equal ["can't be blank"]
  end

  it "recieves error if PUBLICATION YEAR not present" do
    new_work.publication_year = nil   
  
    expect(new_work.valid?).must_equal false
    expect(new_work.errors.messages).must_include :publication_year
    expect(new_work.errors.messages[:publication_year]).must_equal ["can't be blank"]
  end

  it "recieves error if DESCRIPTION not present" do
    new_work.description = nil   
  
    expect(new_work.valid?).must_equal false
    expect(new_work.errors.messages).must_include :description
    expect(new_work.errors.messages[:description]).must_equal ["can't be blank"]
  end

  describe "relationships" do
    before do
      new_work.save
      @new_work = Work.first
    end

    it "a work has zero votes" do
      expect(@new_work.votes.count).must_be :>=,  0
    end


    it "a work can have many votes" do
     @new_work.votes.each do |vote|
      expect(vote).must_be_instance_of Work
     end
    end
  end

  describe "custom methods" do

    describe "top ten method" do
      it "return the top ten works for each media" do
        top_albums = Work.top_ten("album")
        expect(top_albums.length).must_equal 10
      end
    end

    it "will show list if media less than 10" do
      top_books = Work.top_ten("book")
      expect(top_books.length).wont_be_nil
    end

    it "will return empty array if no works" do
      top_movies = Work.top_ten("movie")
      expect(top_movies).must_equal []
    end
  end

  describe "spotlight method" do
    it "returns the overall top media" do 
      top_media = Work.spotlight
      highest_voted = Work.all.max_by{|work| work.votes.count}
      expect(Work.spotlight).must_equal highest_voted
    end 

    it "returns nothing if no works in media" do 
     Work.destroy_all

     expect(Work.spotlight).must_be_nil
    end 
  end
end


require "test_helper"

describe WorksController do
  before do
    @work = Work.create(
      {
        category: "Album",
        title: "Ye",
        creator: "Kanye West",
        publication_year: "2018",
        description: "xxxxxx",
      }
    )
  end

  describe "index" do
    it "responds with success when there are many works saved" do
      #Act
      get works_path

      #Assert
      must_respond_with :success
    end

    it "can get the root path" do
       #Act
       get root_path

       #Assert
       must_respond_with :success

  end
  describe "show" do
    it "can get a valid work" do 
      #Act
      get work_path(@work.id)
      
      #Assert
      must_respond_with :success
    end

    it "can redirect if gets a invalid work" do 
      #Act
      get work_path(-1)

      #Assert
      must_respond_with :redirect
    end
  end
end

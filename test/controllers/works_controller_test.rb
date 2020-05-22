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

  describe "edit" do 
    it "it can edit a work from an existing work list" do
       #Act
      get edit_work_path(@work.id)
      
       #Assert
      must_respond_with :success
    end
    it "response with a redirect when given invaild work id" do
      #Act
      get edit_work_path(-1)

      #Assert
      must_respond_with :redirect
    end
  end

  describe "new" do
    it "can get the new work page"do
      get new_work_path

      must_respond_with :success
    end
  end

  describe "create" do
    work_hash = {
      work: {
        category: "album",
        title: "Greatest Hits",
        creator: "kanye wast",
        publication_year: "2000",
        description: "description" 
        },
      }

    it "can create a new work and returns field"do
      expect{
        post works_path, params: work_hash
      }.must_change "Work.count", 1

      new_work = Work.last
      expect(new_work.category).must_equal work_hash[:work][:category]
      expect(new_work.title).must_equal work_hash[:work][:title]
      must_respond_with :redirect
    end

    it "does not create new work if field missing" do
       created_work = works(:jayz)
       created_work.title = nil 
       expect(created_work.title).must_be_nil
    end
  end
  describe "update" do
    before do 
      @update_work = {
        work: {
          title: "Updated Title",
          description: "Update Description",
          creator: "New Creator"
        }
      }
    end
    it "it can update an existing work" do
      work_id = works(:kindred).id
      patch work_path(work_id), params: @update_work

      edited_work = Work.find_by(id: work_id)
      expect(edited_work.title).must_equal @update_work[:work][:title]
      expect(edited_work.description).must_equal @update_work[:work][:description]
    end
  end
  describe "destroy" do
    it "can delete an existing work" do
      expect{
        delete work_path(works(:fleetwood).id)
    }.must_change "Work.count", 1

    must_respond_with :redirect
    must_redirect_to works_path
    end
  end
end

require "test_helper"

describe UsersController do
   
    describe "index" do
      it "responds with success" do
        #Act
        get users_path
  
        #Assertra
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
        must_respond_with :not_found
      end
    end
end

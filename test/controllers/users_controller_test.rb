require "test_helper"

describe UsersController do
  before do
    @user = users(:user_1)
    @work_1 = works(:eagles)
  end
   
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
      it "can get a valid user" do 
        #Act
        get user_path(@user.id)
        p @user.id
        #Assert
        must_respond_with :success
      end
  
      it "can redirect if gets a invalid work" do 
        #Act
        get user_path(-1)
  
        #Assert
        must_respond_with :redirect
      end
    end


  describe "login form" do
    user_hash = {
      user: {
        username: "A new user"
      },
    }

    it "can retrive the login form" do
      get login_path
      must_respond_with :success
    end
  
   describe "login" do
      it "can create a new user logs in a returning user" do
        
        post login_path(params: user_hash)
        must_respond_with :redirect
        must_redirect_to root_path

        user = User.last
        expect(session[:user_id]).must_equal user.id
      end
    end
  end

   describe "logout" do
      
    it "can log a user off" do
  
      post logout_path
  
      expect(session[:user_id]).must_be_nil 
     
    end
  end
end
  

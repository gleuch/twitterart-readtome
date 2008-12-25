require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a story exists" do
  Story.all.destroy!
  request(resource(:stories), :method => "POST", 
    :params => { :story => { :id => nil }})
end

describe "resource(:stories)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:stories))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of stories" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a story exists" do
    before(:each) do
      @response = request(resource(:stories))
    end
    
    it "has a list of stories" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Story.all.destroy!
      @response = request(resource(:stories), :method => "POST", 
        :params => { :story => { :id => nil }})
    end
    
    it "redirects to resource(:stories)" do
      @response.should redirect_to(resource(Story.first), :message => {:notice => "story was successfully created"})
    end
    
  end
end

describe "resource(@story)" do 
  describe "a successful DELETE", :given => "a story exists" do
     before(:each) do
       @response = request(resource(Story.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:stories))
     end

   end
end

describe "resource(:stories, :new)" do
  before(:each) do
    @response = request(resource(:stories, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@story, :edit)", :given => "a story exists" do
  before(:each) do
    @response = request(resource(Story.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@story)", :given => "a story exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Story.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @story = Story.first
      @response = request(resource(@story), :method => "PUT", 
        :params => { :story => {:id => @story.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@story))
    end
  end
  
end


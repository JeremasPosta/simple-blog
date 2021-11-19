require 'rails_helper'

RSpec.describe Post, type: :model do
  subject{
    Post.create(
                title: "Post",
                content: "Contenido del post.",
                image: "image.jpg",
                category: Category.create(name: "Tech"),
                user_id: User.first.id
              )
  }

  context "at creation" do
    
    it "should save with correct params." do
      expect(subject).to be_valid
    end

    it "should have a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "should have a content" do
      subject.content = nil
      expect(subject).to_not be_valid
    end

    it "should have an image" do
      subject.image = nil
      expect(subject).to_not be_valid
    end

    it "should have a User_id associated" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

  end

end

require 'test_helper'

class NewTest < ActiveSupport::TestCase
  test "valid news" do
    @new = New.new(headline: "Google Removes 'Don't Be Evil' Clause From Its Code of Conduct", content: "https://digiday.com/media/reliable-smaller-video-publishers-see-youtube-safe-harbor/", user_id: 1)
    assert @new.valid?
  end
  
  test "invalid headline news" do
    @new = New.new(headline: "Goog", content: "https://digiday.com/media/reliable-smaller-video-publishers-see-youtube-safe-harbor/", user_id: 1)
    assert !@new.valid?
  end
  
  test "invalid content news" do
    @new = New.new(headline: "Google Removes 'Don't Be Evil' Clause From Its Code of Conduct", content: "digiday.com/media/reliable-smaller-video-publishers-see-youtube-safe-harbor/", user_id: 1)
    assert !@new.valid?
  end
  
  test "empty content news" do
    @new = New.new(headline: "Google Removes 'Don't Be Evil' Clause From Its Code of Conduct", content: "", user_id: 1)
    assert @new.valid?
  end
  
  test "empty headline news" do
    @new = New.new(headline: " ", content: "https://digiday.com/media/reliable-smaller-video-publishers-see-youtube-safe-harbor/", user_id: 1)
    assert !@new.valid?
  end
  
  test "user not exist news" do
    @new = New.new(headline: "Google Removes 'Don't Be Evil' Clause From Its Code of Conduct", content: "https://digiday.com/media/reliable-smaller-video-publishers-see-youtube-safe-harbor/", user_id: 200)
    assert !@new.valid?
  end
end

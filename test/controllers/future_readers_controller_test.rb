require 'test_helper'

class FutureReadersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @book = books(:one)
    sign_in @user
  end

  test "should create future reader" do
    assert_difference("FutureReader.count", 1) do
      post book_future_readers_url(@book)
    end
  end

  test "should not create future reader if not logged in" do
    sign_out @user
    assert_no_difference("FutureReader.count") do
      post book_future_readers_url(@book)
    end
    assert_redirected_to new_user_session_url
  end

  test "should not create future reader if already exists" do
    assert_no_difference("FutureReader.count") do
      post book_future_readers_url(books(:two))
    end
  end

  test "should delete future reader" do
    assert_difference("FutureReader.count", -1) do
      delete book_future_reader_url(books(:two), @user)
    end
  end

  test "should not delete if not logged in" do
    sign_out @user
    assert_no_difference("FutureReader.count") do
      delete book_future_reader_url(books(:two), @user)
    end
    assert_redirected_to new_user_session_url
  end

  test "should not delete future reader if it doesn't exist" do
    assert_no_difference("FutureReader.count") do
      delete book_future_reader_url(@book, @user)
    end
  end

end

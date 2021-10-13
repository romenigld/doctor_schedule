defmodule DoctorSchedule.Accounts.Repositories.SessionTest do
  use DoctorSchedule.DataCase

  alias DoctorSchedule.Accounts.Services.Session
  alias DoctorSchedule.UserFixture

  describe "users" do
    test "authenticate/2 should return user" do
      UserFixture.create_user()
      {:ok, user_authenticate} = Session.authenticate("test@email.com", "some password_hash")
      assert "test@email.com" == user_authenticate.email
    end

    test "authenticate/2 unauthorized password invalid" do
      UserFixture.create_user()
      assert {:error, :unauthorized} = Session.authenticate("test@email.com", "not password_hash")
    end

    test "authenticate/2 should return not_found" do
      UserFixture.create_user()
      result = Session.authenticate("error_test@email.com", "some password_hash")
      assert {:error, :not_found} == result
    end
  end
end

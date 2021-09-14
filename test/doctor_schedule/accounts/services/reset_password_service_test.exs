defmodule DoctorSchedule.Accounts.Services.ResetPasswordServiceTest do
  use DoctorSchedule.DataCase

  alias DoctorSchedule.Accounts.Repositories.TokenRepository
  alias DoctorSchedule.Accounts.Services.ResetPasswordService
  alias DoctorSchedule.UserFixture

  import Mock

  describe "users" do
    test "execute/2 should reset password " do
      user = UserFixture.create_user()
      {:ok, token, _} = TokenRepository.generate(user.email)

      assert {:ok, "Password has updated!"} ==
               ResetPasswordService.execute(token, %{
                 password: "123123",
                 password_confirmation: "123123"
               })
    end

    test "execute/2 should return error token expired" do
      user = UserFixture.create_user()
      {:ok, token, _} = TokenRepository.generate(user.email)

      now = DateTime.utc_now()
      future_date = %{now | hour: now.hour + 5}

      with_mock DateTime, utc_now: fn -> future_date end do
        assert {:error, "Token has expired!"} ==
                 ResetPasswordService.execute(token, %{
                   password: "123123",
                   password_confirmation: "123123"
                 })
      end
    end

    test "execute/2 should retrieve error token does not exist" do
      assert {:error, "Token does not exist!"} ==
               ResetPasswordService.execute("3fc5ac7b-4332-4873-89c8-61011924cada", %{
                 password: "123123",
                 password_confirmation: "123123"
               })
    end
  end
end

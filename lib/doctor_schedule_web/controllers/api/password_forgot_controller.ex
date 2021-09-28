defmodule DoctorScheduleWeb.Api.PasswordForgotController do
  use DoctorScheduleWeb, :controller
  action_fallback DoctorScheduleWeb.FallbackController

  alias DoctorSchedule.Accounts.Services.SendForgotPasswordToEmail

  def create(conn, %{"email" => email}) do
    with {:ok, _user, _token, _email} <- SendForgotPasswordToEmail.execute(email) do
      conn
      |> put_status(:no_content)
      |> put_resp_header("content-type", "application/json")
      |> text("")
    end
  end
end

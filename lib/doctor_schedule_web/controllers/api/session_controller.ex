defmodule DoctorScheduleWeb.Api.SessionController do
  use DoctorScheduleWeb, :controller

  alias DoctorScheduleWeb.Auth.Guardian

  action_fallback DoctorScheduleWeb.FallbackController

  @user %DoctorSchedule.Accounts.Entities.User{
    email: "teste@email.com",
    first_name: "test123",
    id: "83e93c1e-43b6-4390-ba57-386686c90547",
    inserted_at: ~N[2021-08-25 10:46:56],
    last_name: "test123",
    password: nil,
    password_confirmation: nil,
    password_hash:
      "$argon2id$v=19$m=131072,t=8,p=4$j+ySPc9+6dwFn8V8aIwTog$mSdsCOn5SkQYQKNznv/dYL1h49UTQ2h8XLdP5EPtinA",
    role: "user",
    updated_at: ~N[2021-08-25 10:46:56]
  }

  def create(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("show.json", %{user: user, token: token})
    end
  end
end

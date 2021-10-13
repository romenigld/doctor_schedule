defmodule DoctorSchedule.Appointments.Services.DayAvailabilityServiceTest do
  use DoctorSchedule.DataCase

  alias DoctorSchedule.Appointments.Services.DayAvailabilityService
  alias DoctorSchedule.UserFixture

  test "it should see all available hour" do
    provider = UserFixture.create_provider()
    date = Date.utc_today()
    date = %Date{date | day: date.day - 1}
    response = DayAvailabilityService.execute(provider.id, date)

    assert response == [
             %{available: false, hour: 8},
             %{available: false, hour: 9},
             %{available: false, hour: 10},
             %{available: false, hour: 11},
             %{available: false, hour: 12},
             %{available: false, hour: 13},
             %{available: false, hour: 14},
             %{available: false, hour: 15},
             %{available: false, hour: 16},
             %{available: false, hour: 17},
             %{available: false, hour: 18},
             %{available: false, hour: 19}
           ]
  end
end
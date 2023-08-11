defmodule WeightBattleWeb.PageController do
  use WeightBattleWeb, :controller

  @data %{
    "Laura" => %{
      goal: 55.0,
      color: "sky-500",
      data_points: [
        %{
          date: NaiveDateTime.new!(~D[2023-08-07], ~T[08:00:00]),
          weight: 59.9
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-08], ~T[08:00:00]),
          weight: 59.4
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-09], ~T[08:00:00]),
          weight: 59.0
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-10], ~T[08:00:00]),
          weight: 58.7
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-11], ~T[08:00:00]),
          weight: 59.0
        }
      ]
    },
    "Ronald" => %{
      goal: 100.0,
      color: "pink-500",
      data_points: [
        %{
          date: NaiveDateTime.new!(~D[2023-08-07], ~T[08:00:00]),
          weight: 108.5
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-08], ~T[08:00:00]),
          weight: 108.2
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-09], ~T[08:00:00]),
          weight: 107.6
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-10], ~T[08:00:00]),
          weight: 108.1
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-10], ~T[08:00:00]),
          weight: 107.5
        }
      ]
    }
  }

  def add_moving_average(data, alpha \\ 0.5) do
    Enum.map(data, fn {user, user_data} ->
      weights = Enum.map(user_data.data_points, fn point -> point.weight end)
      moving_avgs = moving_average(weights, alpha)

      data_points =
        Enum.zip_with(user_data.data_points, moving_avgs, fn point, avg ->
          Map.put(point, :esma, avg)
        end)

      {user, Map.put(user_data, :data_points, data_points)}
    end)
    |> Enum.into(%{})
  end

  defp moving_average(weights, alpha) do
    Enum.reduce(weights, [], fn x, avgs ->
      avg =
        case avgs do
          [] -> x
          [prev_avg | _] -> alpha * x + (1 - alpha) * prev_avg
        end

      [avg | avgs]
    end)
    |> Enum.reverse()
  end

  def home(conn, _params) do
    render(conn |> assign(:data, @data |> add_moving_average), :home)
  end
end

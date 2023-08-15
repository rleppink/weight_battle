defmodule WeightBattleWeb.IndexLive do
  use WeightBattleWeb, :live_view

  @data %{
    "Laura" => %{
      goal: 55.0,
      color: "sky-500",
      data_points: %{
        labels: [
          "2023-08-07",
          "2023-08-08",
          "2023-08-09",
          "2023-08-10",
          "2023-08-11"
        ],
        values: [
          59.9,
          59.4,
          59.0,
          58.7,
          59.0
        ]
      }
    },
    "Ronald" => %{
      goal: 100.0,
      color: "pink-500",
      data_points: %{
        labels: [
          "2023-08-07",
          "2023-08-08",
          "2023-08-09",
          "2023-08-10",
          "2023-08-11"
        ],
        values: [
          108.5,
          108.2,
          107.6,
          108.1,
          107.5
        ]
      }
    }
  }

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:data, @data) |> push_event("weight_data", @data)}
  end
end

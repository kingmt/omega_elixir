defmodule RecordsApi do
  @user_agent [ {"User-agent", "Elixir"} ]
  @api_key Application.get_env(:omega, :omega_key)

  def fetch do
    api_url
    |> HTTPoison.get(@user_agent)
    |> handle_response()
  end

  def api_url do
    "https://omegapricinginc.com/pricing/records.json?api_key=#{@omega_key}&start_date=#{}&end_date=#{}"
  end

  def handle_response({ :ok, %{status_code: 200, body: body}}) do
    { :ok, Poison.Parser.parse!(body) }
  end

  def handle_response({ _, %{status_code: _, body: body}}) do
    { :error, Poison.Parser.parse!(body) }
  end
end

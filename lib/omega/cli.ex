defmodule Omega.Cli do
  require Logger

  def main(args \\ []) do
    process
  end

  def process do
    Omega.RecordsApi.fetch
    |> decode_response()
    |> Omega.RecordProcessor.add_records()
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    {_, message} = List.keyfind(error, "message", 0)
    Logger.error "Error fetching from Omega: #{message}"
    System.halt(2)
  end

end

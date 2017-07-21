defmodule Ronglianyun do
  @moduledoc """
  Ronglianyun voice code
  http://www.yuntongxun.com/doc/rest/voicecode/3_3_2_1.html
  """

  require URI
  import SweetXml

  @url "https://app.cloopen.com:8883"
  @account_sid  Application.get_env(:ronglianyun, :account_sid)
  @auth_token   Application.get_env(:ronglianyun, :auth_token)
  @app_id       Application.get_env(:ronglianyun, :app_id)
  @caller       Application.get_env(:ronglianyun, :caller)

  @doc """
  请求语音验证码

  """
  @spec to(String.t(), String.t()) :: atom
  def to(phone, content) do
    timestamp = Timex.local |>  Timex.format!("{YYYY}{0M}{0D}{h24}{0m}{0s}")
    sig_param = :crypto.hash(:md5, "#{@account_sid}#{@auth_token}#{timestamp}")
                |> Base.encode16()
    endpoint = "/2013-12-26/Accounts/#{@account_sid}" <>
               "/Calls/VoiceVerify?sig=#{sig_param}"
    data = %{app_id: @app_id,
             verify_code: content,
             to: phone,
             display_num: @caller,
             play_times: 3}
            |> to_camel_case
            |> Poison.encode!
    headers = [{"Authorization", Base.encode64("#{@account_sid}:#{timestamp}")},
               {"Content-Type", "application/json;charset=utf-8"}]
    URI.merge(@url, endpoint)
    |> to_string
    |> HTTPoison.post(data, headers)
    |> case do
      {:ok, body} ->
        body
        |> Map.get(:body)
        |> String.trim
        |> parse_xml_body
      _ -> :error
    end
  end

  defp parse_xml_body(body) do
    body
    |> xpath(~x"//statusCode/text()")
    |> case do
      '000000' -> :ok
      _ -> :error
    end
  end

  defp to_camel_case(pairs) do
    for {k, v} <- pairs, into: %{}, do: {Inflex.camelize(k, :lower), v}
  end
end

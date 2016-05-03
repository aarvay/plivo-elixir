defmodule Plivo do
  import Plivo.API

  def get_account do
    call :get
  end

  def send_message(params) do
    call :post, "/Message/", params
  end
end

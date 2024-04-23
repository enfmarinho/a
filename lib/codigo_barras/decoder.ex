defmodule Codigobarras.Decoder do
  def ler_codigo_barras() do
    # TODO return a list with 44 ints in the expected order 
    # [codigo_banco, moeda, dv, data_vencimento, valor, convenio, dados_especificos] 
    list = []
    split_informacoes(list)
  end
  defp split_informacoes(list) do
    [head | tail] = Enum.split(list, 3)
    codigo_banco = head
    [head | tail] = Enum.split(tail, 1)
    moeda = head
    [head | tail] = Enum.split(tail, 1)
    dv = head
    [head | tail] = Enum.split(tail, 4)
    data_vencimento = head
    [head | tail] = Enum.split(tail, 10)
    valor = head
    [head | tail] = Enum.split(tail, 11)
    convenio = head
    dados_especificos = tail

    codigo_banco |> imprimir_codigo_banco
    moeda |> imprimir_moeda
    data_vencimento |> imprimir_data_vencimento
    valor |> imprimir_valor
    convenio |> imprimir_tipos_convenio
    dados_especificos |> imprimir_dados_especificos

    # TODO check if this function call is correctly
    Encoder.imprimir_linha_digital(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos)
  end
  defp imprimir_codigo_banco(codigo_banco) do
    "Codigo do banco: " |> IO.write
    codigo_banco |> IO.inspect
  end
  defp imprimir_moeda(moeda) do
    "moeda: " |> IO.write
    moeda |> IO.inspect
  end
  defp imprimir_data_vencimento(data_vencimento) do 
    "data_vencimento: " |> IO.write
    data_vencimento |> IO.inspect
  end
  defp imprimir_valor() do
    "Valor: " |> IO.write
    valor |> IO.inspect
  end
  defp imprimir_tipos_convenio(convenio) do
    "Convenio: " |> IO.write
    convenio |> IO.inspect
  end
  defp imprimir_dados_especificos(dados_especificos) do
    "Dados especificos: " |> IO.write
    dados_especificos |> IO.inspect
  end
end

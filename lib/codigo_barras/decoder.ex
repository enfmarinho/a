defmodule Codigobarras.Decoder do
  defp print_list([]), do: []
  defp print_list(list) do
    [head | tail] = list
    head |> IO.write
    print_list(tail)
  end

  def ler_codigo_barras() do
    codigo_barras = IO.gets("Digite a sequencia do codigo de barras: ")
      |> String.trim()
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
    case length(codigo_barras) do
      44 ->  split_informacoes(codigo_barras)
      _ -> "Código inválido" |> IO.puts
            ler_codigo_barras()
    end
  end

  defp split_informacoes(list) do
    {codigo_banco, tail} = Enum.split(list, 3)
    {moeda, tail} = Enum.split(tail, 1)
    moeda = hd(moeda)
    {dv, tail} = Enum.split(tail, 1)
    dv = hd(dv)
    {data_vencimento, tail} = Enum.split(tail, 4)
    {valor, tail} = Enum.split(tail, 10)
    {convenio, dados_especificos} = Enum.split(tail, 4)

    codigo_banco |> imprimir_codigo_banco
    moeda |> imprimir_moeda
    data_vencimento |> imprimir_data_vencimento
    valor |> imprimir_valor
    convenio |> imprimir_tipos_convenio
    dados_especificos |> imprimir_dados_especificos

    Codigobarras.Encoder.imprimir_linha_digitavel(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv)
  end

  defp imprimir_codigo_banco(codigo_banco) do
    "Codigo do banco: " |> IO.write
    codigo_banco |> print_list
    IO.puts("")
  end

  defp imprimir_moeda(moeda) do
    "moeda: #{moeda} " |> IO.puts
  end

  defp imprimir_data_vencimento(data_vencimento) do 
    "data_vencimento: " |> IO.write
    data_vencimento |> print_list
    IO.puts("")
  end

  defp imprimir_valor(valor) do
    "Valor: " |> IO.write
    valor |> print_list
    IO.puts("")
  end

  defp imprimir_tipos_convenio(convenio) do
    "Convenio: " |> IO.write
    convenio |> print_list
    IO.puts("")
  end

  defp imprimir_dados_especificos(dados_especificos) do
    "Complemento: " |> IO.write
    {complemento, tail} = Enum.split(dados_especificos, 7)
    print_list(complemento)
    IO.puts("")
    "Agência: " |> IO.write
    {agencia, tail} = Enum.split(tail, 4)
    print_list(agencia)
    IO.puts("")
    "Conta: " |> IO.write
    {conta, tail} = Enum.split(tail, 8)
    print_list(conta)
    IO.puts("")
    "Carteira: " |> IO.write
    {carteira, _tail} = Enum.split(tail, 2)
    print_list(carteira)
    IO.puts("")
  end
end

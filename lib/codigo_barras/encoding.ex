defmodule Codigobarras.Encoding do
  def validar_codigo_barras(codigo) when is_list(codigo) and length(codigo) == 44 do
    {:ok, codigo}
  end

  def ler_codigo_banco do
    IO.puts("Digite os 3 dígitos do código do banco: ")
    ler_lista(3)
  end

  def ler_moeda do
    IO.puts("Digite o código da moeda: ")
    ler_lista(1)
  end

  def ler_fator_vencimento do
    IO.puts("Digite o fator de vencimento: ")
    ler_lista(4)
  end

  def ler_proximo_bloco do
    IO.puts("Digite os próximos 11 dígitos: ")
    ler_lista(11)
  end

  def ler_lista(size) do
    input = IO.gets("")
      |> String.trim()
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)

    case length(input) == size do
      true -> {:ok, input}
      false -> {:error, "Número incorreto de dígitos. Por favor, insira exatamente #{size} dígitos."}
    end
  end

  def ler_e_validar_codigo do
    IO.puts("Por favor, insira o código de barras:")

    codigo_banco = ler_codigo_banco()
    case codigo_banco do
      {:ok, banco} ->
        moeda = ler_moeda()
        case moeda do
          {:ok, moeda} ->
            fator_vencimento = ler_fator_vencimento()
            case fator_vencimento do
              {:ok, fator} ->
                bloco1 = ler_proximo_bloco()
                case bloco1 do
                  {:ok, bloco1} ->
                    bloco2 = ler_proximo_bloco()
                    case bloco2 do
                      {:ok, bloco2} ->
                        codigo = banco ++ moeda ++ fator ++ bloco1 ++ bloco2
                        case validar_codigo_barras(codigo) do
                          {:ok, _} ->
                            IO.puts("Lista completa: #{codigo}")
                            {:ok, codigo}
                          error ->
                            error
                        end
                      error -> error
                    end
                  error -> error
                end
              error -> error
            end
          error -> error
        end
      error -> error
    end
  end
  end


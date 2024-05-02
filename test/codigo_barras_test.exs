defmodule CodigoBarrasTest do
  use ExUnit.Case
  doctest CodigoBarras

  test "Testing the reader of the bar code " do
    
    input_codigo_banco = "001\n"
    expected_codigo_banco = {:ok ,[0,0,1]}
    assert capture_io([input: input], fn -> assert Codigobarras.Encoder.ler_codigo_banco() == expected_codigo_banco end) == input

    #exemplo de teste 
    end

    test "Teste de códigos de barras com 44 dígitos" do
      
      #TODO
    end

    test "Teste de códigos de barras diferente de 44 dígitos" do
      
      #TODO
    end

    test "Linha digitável de 47 dígitos " do
      
      #TODO
    end

    test "Linha digitável diferente de 47 dígitos" do
      
      #TODO
    end

    test "Carregando código de barras e colocando em PNG" do
      
      #TODO
    end

  test "Decodificador recebe "

end

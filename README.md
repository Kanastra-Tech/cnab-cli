# CNAB CLI

A CLI tool for parsing CNAB files and converting them to CSV format.

## Installation

```bash
brew tap Kanastra-Tech/cnabcli
brew install cnabcli
```

# CNAB Parser CLI

Uma ferramenta de linha de comando para converter arquivos CNAB (Centro Nacional de Automação Bancária) para formato CSV, facilitando a análise e manipulação dos dados.

## O que é CNAB?

CNAB é um padrão brasileiro para troca de informações bancárias entre bancos e empresas. Os arquivos CNAB possuem formato de texto com campos de tamanho fixo, o que torna difícil sua leitura e análise direta.

## O que esta ferramenta faz?

Este CLI lê arquivos CNAB e:
- Extrai automaticamente todos os campos seguindo o layout padrão
- Ignora o cabeçalho (primeira linha) e o trailer (última linha) do arquivo
- Converte os dados para formato CSV, muito mais fácil de trabalhar em Excel, Google Sheets ou outros programas
- Preserva todos os 52 campos do registro CNAB

## Como usar

### Uso básico

```bash
cnab-cli parse-cnab arquivo_cnab.txt
```

Isso irá:
1. Ler o arquivo `arquivo_cnab.txt`
2. Processar todas as linhas de dados (exceto cabeçalho e trailer)
3. Gerar um arquivo `arquivo_cnab.csv` no mesmo diretório

### Especificando delimitador personalizado

Por padrão, o CSV usa ponto-e-vírgula (;) como separador. Para usar vírgula:

```bash
cnab-cli parse-cnab arquivo_cnab.txt -d ,
```

Ou para usar TAB:

```bash
cnab-cli parse-cnab arquivo_cnab.txt -d "	"
```

### Exemplos práticos

**Exemplo 1: Processando um arquivo de remessa**
```bash
cnab-cli parse-cnab remessa_202501.txt
# Saída: remessa_202501.csv
```

**Exemplo 2: Processando múltiplos arquivos**
```bash
# No Windows
for %f in (*.txt) do cnab-cli parse-cnab "%f"

# No Linux/Mac
for f in *.txt; do cnab-cli parse-cnab "$f"; done
```

## Verificando a ajuda

Para ver todas as opções disponíveis:

```bash
cnab-cli --help
cnab-cli parse-cnab --help
```

## Troubleshooting

**Erro: "file not found"**
- Verifique se o arquivo existe e se o caminho está correto
- Use o caminho completo se necessário: `cnab-cli parse-cnab C:\Users\arquivo.txt`

**Erro: "delimiter must be a single character"**
- O delimitador deve ser apenas um caractere
- Use aspas se necessário: `-d " "`

**O CSV está desformatado no Excel**
- Verifique se o Excel está configurado para usar o mesmo delimitador
- Tente abrir como "Importar dados" ao invés de duplo clique
- Use `-d ,` se o Excel espera vírgula como separador

## Requisitos

- Sistema operacional: Windows, Linux ou macOS
- Não requer instalação adicional, apenas o executável

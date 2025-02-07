Documentação do Projeto: Sistema de Inventário
Visão Geral
O projeto é um sistema de inventário desenvolvido em Flutter, que permite o gerenciamento de equipamentos. Ele inclui funcionalidades como autenticação de usuários, cadastro manual de equipamentos, leitura de QR codes para atualização de inventário e armazenamento local de dados usando Hive. O Firebase é utilizado para autenticação e armazenamento em nuvem.

Estrutura do Projeto
1. Arquivo Principal (main.dart)
Responsabilidade: Inicializa o aplicativo, configura o Firebase e o Hive, e define as rotas do aplicativo.

Funcionalidades:

Inicializa o Firebase com as opções padrão.

Inicializa o Hive para armazenamento local.

Define a tela inicial (LoginScreen) e as rotas para outras telas (EquipamentosScreen e QRScannerScreen).

2. Modelo de Dados (equipamento.dart)
Responsabilidade: Define a estrutura de dados para os equipamentos.

Atributos:

id: Identificador único do equipamento.

nome: Nome do equipamento.

codigo: Código do equipamento.

ultimaData: Data da última atualização do inventário.

Métodos:

toMap(): Converte o objeto Equipamento em um mapa para armazenamento.

fromMap(): Cria um objeto Equipamento a partir de um mapa.

isInventoryValid(): Verifica se o inventário do equipamento é válido (última atualização dentro de 30 dias).

3. Tela de Login (login_screen.dart)
Responsabilidade: Permite que o usuário faça login no sistema.

Funcionalidades:

Validação de campos de email e senha.

Autenticação usando o Firebase Auth.

Navegação para a tela de equipamentos após o login bem-sucedido.

Exibição de mensagens de erro em caso de falha no login.

4. Tela de Equipamentos (equipamentos_screen.dart)
Responsabilidade: Exibe a lista de equipamentos cadastrados.

Funcionalidades:

Carrega a lista de equipamentos do banco de dados (Firestore ou Hive).

Exibe um indicador de carregamento enquanto os dados são buscados.

Mostra uma mensagem se nenhum equipamento for encontrado.

Utiliza o widget EquipamentoItem para exibir cada equipamento na lista.

5. Tela de Cadastro Manual (manual_add_screen.dart)
Responsabilidade: Permite o cadastro manual de equipamentos.

Funcionalidades:

Campos para inserir o nome e o código do equipamento.

Validação dos campos antes de salvar.

Salva o equipamento no banco de dados e retorna à tela de equipamentos.

6. Tela de Leitura de QR Code (qr_scanner_screen.dart)
Responsabilidade: Permite a leitura de QR codes para atualizar o inventário.

Funcionalidades:

Utiliza a biblioteca qr_code_scanner para escanear QR codes.

Retorna o código escaneado para a tela anterior.

Atualiza a data do inventário no banco de dados com base no código escaneado.

7. Serviços
DBService: Responsável por interagir com o banco de dados (Firestore ou Hive) para operações CRUD (Create, Read, Update, Delete) relacionadas aos equipamentos.

AuthService: Responsável por gerenciar a autenticação do usuário usando o Firebase Auth.

8. Widgets
EquipamentoItem: Widget personalizado para exibir os detalhes de um equipamento na lista de equipamentos.

Fluxo do Aplicativo
Login:

O usuário insere suas credenciais (email e senha) na LoginScreen.

Se o login for bem-sucedido, o usuário é redirecionado para a EquipamentosScreen.

Listagem de Equipamentos:

Na EquipamentosScreen, a lista de equipamentos é carregada do banco de dados e exibida.

O usuário pode adicionar novos equipamentos manualmente ou escanear um QR code para atualizar o inventário.

Cadastro Manual de Equipamentos:

O usuário navega para a ManualAddScreen para cadastrar um novo equipamento.

Após preencher os campos e salvar, o equipamento é adicionado ao banco de dados.

Leitura de QR Code:

O usuário navega para a QRScannerScreen para escanear um QR code.

O código escaneado é retornado e o inventário é atualizado com a data atual.

Dependências Externas
Firebase: Utilizado para autenticação e armazenamento em nuvem.

firebase_core: Inicialização do Firebase.

firebase_auth: Autenticação de usuários.

cloud_firestore: Armazenamento de dados em nuvem (opcional, dependendo da implementação do DBService).

Hive: Utilizado para armazenamento local de dados.

hive e hive_flutter: Gerenciamento de banco de dados local.

QR Code Scanner: Utilizado para escanear QR codes.

qr_code_scanner: Biblioteca para leitura de QR codes.

Considerações Finais
Este projeto é um exemplo de um sistema de inventário básico, mas pode ser expandido com funcionalidades adicionais, como:

Integração com câmera para captura de fotos dos equipamentos.

Sincronização de dados entre o armazenamento local (Hive) e o Firebase.

Relatórios e análises de inventário.

Controle de permissões de usuário (admin, usuário comum, etc.).

A estrutura modular do projeto facilita a adição de novas funcionalidades e a manutenção do código existente.

Ps: preferia ter feito em flutterflow, devido a praticidade do lowcode, mas como era necessário o codigo fonte, decidi fazer diretamente com o flutter.
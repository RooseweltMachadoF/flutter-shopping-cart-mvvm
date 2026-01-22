# flutter-shopping-cart-mvvm

🛒 Shopping Cart App - Challenge
Este projeto é uma aplicação de e-commerce completa desenvolvida em Flutter, seguindo a arquitetura MVVM (Model-View-ViewModel). O app consome a Fake Store API e gerencia um fluxo de compra completo, desde o catálogo até a finalização do pedido.

🛠️ Tecnologias e Requisitos
Flutter: ^3.27.0 (ou superior)

Dart: ^3.6.0

Gerenciador de Estado: Provider

Navegação: Navigator nativo com Mixins

Arquitetura: MVVM (Model-View-ViewModel)

🚀 Como Executar o Projeto
1- Clone o repositório:
git clone https://github.com/RooseweltMachadoF/flutter-shopping-cart-mvvm.git

2- Acesse a pasta do projeto:
cd shopping_cart

3- Instale as dependências:
flutter pub get

4- Execute o aplicativo:
flutter run

📁 Estrutura de Pastas e Arquitetura
O projeto utiliza MVVM para garantir separação de responsabilidades e testabilidade:

Data: Models e Repositories (Consumo de API).

Core: Configurações globais, Mixins, Enums, Temas e Widgets reutilizáveis.

Presentation: Views e ViewModels (Regras de negócio da UI).

✨ Funcionalidades
1. Catálogo e Detalhes

Listagem dinâmica de produtos via API.

Tela de detalhes com Hero Animation e gradientes personalizados.

Filtro automático de limite de 10 produtos diferentes no carrinho.

2. Sacola (Carrinho)

Controle de quantidade (+/-) por item.

Cálculo de subtotal em tempo real.

Simulação de erro de API: Ao remover um item, o app simula uma latência de rede e exibe um erro via SnackBar (Item 4.c.i do desafio).

3. Checkout e Pedidos

Simulação de checkout assíncrono.

Tela de resumo de pedido com cálculo de frete simulado.

Navegação automática e limpeza de estado após finalização.

📜 Histórico de Commits
O histórico foi organizado por features principais, seguindo boas práticas de mensagens descritivas:

feat: products listing and architecture setup

feat: cart logic and product limit rules

feat: product details with hero animation

feat: cart flow with API error simulation

feat: checkout and order summary completion

Gif testando o APP
![alt text](<Gravação de Tela 2026-01-22 às 04.26.49.gif>)
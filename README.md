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

📁 Arquitetura e Padrões de Projeto
O projeto foi evoluído para seguir os princípios da Clean Architecture, separando as regras de negócio das implementações externas:

- **Domain:** Entidades puras (`ProductEntity`) e Casos de Uso (`GetProductsUseCase`).
- **Data:** Repositórios e Models (DTOs) que lidam com a Fake Store API.
- **Presentation:** - **ViewModels:** Orquestram o estado da UI sem lógica de API direta.
  - **Commands:** Padrão de projeto para encapsular ações (ex: `LoadProductsCommand`), gerenciando automaticamente estados de loading, sucesso e erro.
- **Core:** Utilitários globais e a `sealed class Result`, garantindo tratamento de erros funcional e tipado.

🧪 Testes e Qualidade de Código
Implementação de testes automatizados cobrindo os cenários críticos:

- **Testes Unitários (ViewModel):** Validação do fluxo de `loading`, `error` e `success` ao buscar produtos.
- **Testes de Widget (UI):** Uso de `pump()` para verificar a renderização por estado (ex: se o spinner aparece no carregamento e se a mensagem de erro surge na falha).
- **Mocks:** Utilização do pacote `mocktail` para simular dependências e garantir testes isolados e rápidos.

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

🌟 Diferenciais Implementados (Extras do Desafio)
- [x] **Padrão Command/Result:** Gerenciamento de estado robusto e escalável.
- [x] **Clean Architecture:** Camada de domínio isolada para maior testabilidade.
- [x] **Responsividade e Layout:** Tratamento de `RenderFlex Overflow` e uso de `LayoutBuilder`.
- [x] **Tratamento de Erros:** Feedback visual com widgets de erro customizados e retry logic.

📜 Histórico de Commits
O histórico foi organizado por features principais, seguindo boas práticas de mensagens descritivas:

feat: products listing and architecture setup

feat: cart logic and product limit rules

feat: product details with hero animation

feat: cart flow with API error simulation

feat: checkout and order summary completion

Gif testando o APP
![alt text](<Gravação de Tela 2026-01-22 às 04.26.49.gif>)
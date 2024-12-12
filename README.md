# Projeto: Gerenciamento de Usuários com Seleção de Avatares

Este projeto Flutter combina funcionalidades de listagem, cadastro e edição de usuários, incluindo uma experiência visual interativa para a seleção de avatares. Ideal para aplicações que requerem personalização de perfil e gerenciamento de dados de usuários.


## 📋 Funcionalidades
- 🗂️ **Listagem de Usuários**: Exibe uma lista com os dados dos usuários cadastrados.
- 📝 **Cadastro de Novos Usuários**: Permite adicionar usuários, com validação de campos como nome e e-mail.
- ✏️ **Edição de Usuários**: Possibilita atualizar dados de usuários existentes.
- 🖼️ **Seleção de Avatares**: Durante o cadastro ou edição, é possível escolher um avatar a partir de uma lista de imagens.
- 🔄 **Estado Dinâmico**: A seleção de avatares reflete em tempo real, com feedback visual.
- 🌐 **URLs de Rede para Avatares**: Carregamento dinâmico de imagens a partir de URLs.


## 🚀 Tecnologias Utilizadas

- **Dart**: Linguagem de programação.
- **Flutter**: Framework para desenvolvimento multiplataforma.
- **Widgets Personalizados**: Criação de componentes como `SelectableAvatar` e `AvatarSelector`.


## 🛠️ Como Configurar o Projeto

1. **Verifique as versões do Flutter e Dart**:
    - **Flutter**: 3.19.0
    - **Dart**: 3.3.0
    - Verifique suas versões instaladas:
      ```bash
      flutter --version
      ```
    - Atualize se necessário:
      ```bash
      flutter upgrade
      ```

2. **Clone o repositório**:
   ```bash
   git clone https://github.com/theyanwillian/projeto-gerenciamento-usuarios
   cd projeto-gerenciamento-usuarios
   ```
   
3. **Instale as dependências**:
   ```bash
   flutter pub get
   ```
   
4. **Rode o projeto**:
   ```bash
   flutter run
   ```
   
5. **Selecione o dispositivo: Certifique-se de que um emulador ou dispositivo físico esteja conectado.**

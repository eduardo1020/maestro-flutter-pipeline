# 🚀 Flutter E2E Pipeline with Maestro & GitHub Actions

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Maestro](https://img.shields.io/badge/Maestro-Cloud-333333?style=for-the-badge)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![Allure Report](https://img.shields.io/badge/Allure_Report-FF6C37?style=for-the-badge&logo=qameta&logoColor=white)

PoC (Prova de Conceito) focada em automação de testes End-to-End (E2E) para aplicações **Flutter**, utilizando **Maestro**, integração contínua via **GitHub Actions** e geração automática de dashboards com **Allure Report**.

Projeto construído considerando regras de layout, proporções e desafios de integração para **Terminais Smart POS (como a Cielo LIO V3)**.

---

## 📌 Sobre o Projeto

Este projeto demonstra a implementação de uma esteira completa de **CI/CD** voltada para a garantia de qualidade (QA Automation) em aplicativos móveis. O objetivo principal foi criar uma pipeline ágil, confiável e independente de hardware físico local para executar fluxos críticos de usuário na nuvem.

### 🛠️ Tecnologias e Ferramentas

* **Framework Mobile:** Flutter (gerenciando SDKs de forma determinística via **FVM**).
* **Automação E2E:** [Maestro](https://maestro.mobile.dev/) (framework declarativo em YAML).
* **Execução em Nuvem:** Maestro Cloud (Mobile.dev).
* **CI/CD:** GitHub Actions.
* **Relatórios:** JUnit XML + Allure Report (gerado automaticamente como artefato de build).

---

## 💡 O que este projeto demonstra para o Mercado (Tech Stack & Best Practices)

* **E2E Moderno em Flutter:** Uso de seletores declarativos e fluxos visuais do Maestro, contornando a complexidade do Driver nativo.
* **Padronização de Ambiente (FVM):** A pipeline lê automaticamente o arquivo `.fvmrc` do projeto (`flutter-version-file: '.fvmrc'`), garantindo que o ambiente da nuvem seja idêntico ao de desenvolvimento local.
* **Testes Orientados a Terminais POS (Smart POS / Cielo LIO V3):** Estrutura de testes preparada para telas compactas ($720 \times 1280$ / $720 \times 1440$), utilizando abordagem de *Mocking* na camada de SDKs de hardware para permitir execução contínua em *device farms*.
* **Observabilidade & QA Governance:** Exportação de relatórios `JUnit` e geração automática de dashboards HTML via **Allure Report**, facilitando a análise de falhas por times de QA e produto.

---

## 🧠 Desafios Enfrentados e Aprendizados

Durante a construção do projeto e da esteira, foram superados diversos problemas reais de engenharia de software e DevOps:

1. **Gestão de Recursos em Ambiente Local:**
   * Resolução de gargalos de espaço em disco e limpeza de caches do Gradle e do ambiente virtualizado (`~/.Genymobile`), liberando **>21 GB** de armazenamento.
2. **Resolução de Conflitos do Gradle Daemon:**
   * Diagnóstico e correção de exceções `NoSuchFileException` e inconsistências no cache do Gradle durante o build de debug do APK em ambientes limpos.
3. **Sincronização de Assinaturas e Application IDs:**
   * Alinhamento estrito do `applicationId` configurado no Gradle Kotlin DSL (`build.gradle.kts`) com o `appId` declarativo utilizado nos fluxos do Maestro (`com.example.maestro_flutter_poc`).
4. **Adequação às versões da CLI do Maestro Cloud:**
   * Configuração de flags atualizadas da CLI (`--app-file`, `--device-model`, `--format junit`) e mapeamento correto de subdiretórios de teste (`maestro/flows/`).

---

## 🔄 Fluxo da Pipeline (CI/CD)

A pipeline é disparada a cada `push` ou `pull request` nas branches principais:

```mermaid
graph TD
    A[Push / PR no GitHub] --> B[Setup Flutter via .fvmrc]
    B --> C[Flutter Pub Get & Build APK Debug]
    C --> D[Instalação da CLI do Maestro]
    D --> E[Execução dos Testes no Maestro Cloud]
    E --> F[Geração do Relatório JUnit XML]
    F --> G[Compilação do Dashboard Allure Report]
    G --> H[Upload do Artefato HTML para Download]
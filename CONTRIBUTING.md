# 💝 Contributing

Thank you for your interest in contributing to this project, **django-slack-tools**!

## 🐛 Reporting issues

Please report issues in our [GitHub repository](https://github.com/lasuillard-s/django-slack-tools/issues). Before submitting an issue, please search for existing issues to avoid duplicates.

## 🏗️ Project overview

This project provides utilities and examples to help you integrate Slack into your Django project. Key features include:

- Django app for Slack messaging with database integration and an admin interface
- Various templates for Slack messages, including Python dictionary-based templates, XML templates, and more
- Slack integration features for core Django ecosystem tools such as Celery

### 🛠️ Tech stack

This project uses the following tech stack:

- [Python](https://www.python.org) 3.10+
- [Django](https://www.djangoproject.com/) LTS
- [slack-bolt](https://github.com/slackapi/bolt-python) for Slack integrations
- [uv](https://docs.astral.sh/uv/) for dependency management and packaging
- [Ruff](https://docs.astral.sh/ruff/) to lint and format Python code, and [mypy](https://mypy-lang.org) for type checking
- [pytest](https://docs.pytest.org/en/latest) for testing

### 📂 Key directory structure

- `django_slack_tools/`: The project's source code
- `docs/`: Project documentation
- `examples/`: Project usage examples
- `testproj/`: Test Django project for development
- `tests/`: Project tests
- `flake.nix`: Flake configuration for the development environment
- `Justfile`: Commands for development
- `pyproject.toml`: Project dependencies and configuration

## 🔧 Set up the development environment

For development, the following tools are required:

### ❄️ Tools managed via Nix Flakes

This repository uses [Nix Flakes](https://nix.dev/concepts/flakes.html) to manage tools. The following tools are automatically installed (requires `nix` to be installed):

- `pre-commit`
- `just`
- `uv`
- `pipx`
- `gettext` for i18n
- `ngrok` for local Slack bot testing

Simply run `nix develop` to start the development environment, then run `just install` to install dependencies.

If you prefer using a [Dev Container](https://containers.dev), a configuration file ([devcontainer.json](./.devcontainer.example/devcontainer.json)) is provided with Nix pre-installed.

## ✅ Verifying changes

Before pushing your code, verify that your changes adhere to the project's coding standards. Run `just ci` to execute all necessary linters, formatters, and tests. Alternatively, let the `pre-commit` hooks handle this automatically.

## ✨ Submitting changes

Feel free to submit pull requests on GitHub. Before opening a PR, ensure your changes pass all checks by running `just ci`.

## 🚀 Release process

This project's distribution is built using `uv` and published to PyPI via GitHub Actions. To release a new version, follow these steps:

1. Dispatch workflow [prepare-release](./.github/workflows/prepare-release.yaml) with the new version as input
1. Review and merge the generated pull request
1. Create and publish a GitHub release with the new version as tag
1. The release workflow will automatically build and publish the package to PyPI

# django-slack-tools

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![codecov](https://codecov.io/gh/lasuillard-s/django-slack-tools/graph/badge.svg?token=c8kzjqjplF)](https://codecov.io/gh/lasuillard-s/django-slack-tools)
[![PyPI - Version](https://img.shields.io/pypi/v/django-slack-tools)](https://pypi.org/project/django-slack-tools/)

Little helpers for working with Slack bots 🤖 in Django.

This project aims to implement helpful features for Slack bots and to provide reusable Django apps with database integration.

## ✨ Features

- Reusable Django app for Slack messaging with various messaging backends for different environments
- Database-backed Slack messaging policies with simple dictionary-based templates
- Message histories
- Built-in admin for managing Slack workspace integrations
- Celery support for messaging backends, management tasks, and shortcut workflows
- Django template support

And more on the future roadmap...

- [ ] New Django apps and helpers for Slack features such as modals, event subscriptions, etc.
- [ ] Better templating experience
- [ ] A more complete working example with richer documentation

Currently it is focused on messaging features. In the future, we hope to add more helpful Slack bot features across the ecosystem, such as event subscriptions, modals, and bot interactions.

## 🚀 Quick start

> [!WARNING]
> This project is still in early development and not recommended for production use.

Install the package:

```bash
$ pip install django-slack-tools
```

Add the app to your Django settings:

```python
INSTALLED_APPS = [
    ...
    "django.contrib.messages", # Used in admin
    "django_slack_tools.slack_messages",
    ...
]
```

Add configuration for the application (the Slack app should already be configured):

```python
DJANGO_SLACK_TOOLS = {
    "slack_app": "<module.path.to.your-slack-app>",
    "messengers": {
        "default": {
            "class": "django_slack_tools.messenger.shortcuts.Messenger",
            "kwargs": {
                "template_loaders": [
                    "django_slack_tools.slack_messages.messenger.DjangoTemplateLoader",
                ],
                "middlewares": [],
                "messaging_backend": {
                    "class": "django_slack_tools.messenger.shortcuts.SlackBackend",
                    "kwargs": {
                        "slack_app": "<module.path.to.your-slack-app>",
                    },
                },
            },
        },
    }
}
```

Then run the database migration and create a `greet.xml` file in your `templates/` directory:

```xml
<root>
    <block type="section">
        <text type="mrkdwn">
            {{ greet }}
        </text>
    </block>
</root>
```

Send a message:

```python
from django_slack_tools.slack_messages.shortcuts import slack_message

message = slack_message(
    "<channel-id>",
    template="greet.xml",
    context={"greet": "Hello, World!"},
)
```

Please check the [documentation](https://lasuillard-s.github.io/django-slack-tools/) for more examples and details.

## 💖 Contributing

All contributions and help are welcome. Please check the [CONTRIBUTING.md](https://github.com/lasuillard-s/django-slack-tools/blob/main/CONTRIBUTING.md) file for contribution guides.

## 📜 License

This project is licensed under the terms of the MIT license.

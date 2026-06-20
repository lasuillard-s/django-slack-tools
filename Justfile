_default:
    just --list

# Install deps and tools
install:
    uv python install
    uv sync --frozen

# Update deps and tools
update:
    uv sync --upgrade
    pre-commit autoupdate

alias up := update

# =============================================================================
# Development
# =============================================================================

# Run all checks
ci: (format "yes") lint test

# Autoformat code
[arg("check", long="check", value="yes")]
format check="no":
    uv run ruff format {{ if check == "yes" { "--check" } else { "" } }} .

alias fmt := format

# Run all linters
lint:
    uv run ruff check .
    uv run mypy --show-error-codes --pretty .

# Run all tests
test:
    uv run nox

# Apply autofixes
fix:
    uv run ruff check --fix .
    uv run ruff format .

# Build this project
build:
    uv build

# Run development server for test project
run:
    uv run python manage.py runserver

# Start local documentation server
docs:
    uv run mkdocs serve

# =============================================================================
# Utility
# =============================================================================

# Run Django shell for test project
shell:
    uv run python manage.py shell

alias sh := shell

# Create database migrations
migration:
    uv run python manage.py makemigrations

# Apply database migrations
migrate:
    uv run python manage.py migrate

# Create local admin user (ID/PW admin/admin)
superuser:
    DJANGO_SUPERUSER_USERNAME=admin DJANGO_SUPERUSER_EMAIL=admin@admin.admin DJANGO_SUPERUSER_PASSWORD=admin \
        uv run python manage.py createsuperuser --no-input

alias su := superuser

# Update translation files
messages:
    uv run python manage.py makemessages --all --ignore 'examples/*' --no-obsolete

alias msg := messages

# Compile translation files
compile-messages:
    uv run python manage.py compilemessages --ignore 'examples/*'

alias compmsg := compile-messages

# Remove temporary files
clean:
    rm --recursive --force \
        .mypy_cache/ \
        .pytest_cache/ \
        .ruff_cache/ \
        dist/ \
        coverage.xml \
        junit.xml
    find . -path '*/__pycache__*' -delete
    find . -path "*.log*" -delete

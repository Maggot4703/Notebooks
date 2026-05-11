# Makefile for Crew: linting, formatting, and testing

.PHONY: lint format test coverage all

lint:
	flake8 Crew/

format:
	black Crew/

test:
	pytest tests/

coverage:
	pytest --cov=Crew tests/

all: lint test

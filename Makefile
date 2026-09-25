SHELL := /bin/bash

VENV := venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

.PHONY: install run clean

install:
	@echo "... Installing ..."
	@python3 -m venv $(VENV)
	@$(PYTHON) -c "import sys; print(f'Python {sys.version.split()[0]} found')"
	@set -e; \
	source $(VENV)/bin/activate; \
	pip install --upgrade pip; \


run:
	@echo "... Running ..."
	@set -e; \
	source $(VENV)/bin/activate; \
	$(PYTHON) plagiarism_detector.py


clean:
	@echo "... Clean ..."
	@rm -rf $(VENV)
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete

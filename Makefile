SHELL := /bin/bash

PYTHON := python3
VENV := venv

.PHONY: install run clean

install:
	@$(PYTHON) -m venv $(VENV)

	@echo "... Venv init ..."
	@if [ "$$SHELL" = "*/fish" ]; then \
		@source $(VENV)/bin/activate.fish; \
	else \
		@source $(VENV)/bin/activate; \
	fi; \
	@$(PYTHON) -m pip install --upgrade pip


run:
	@$(PYTHON) plagiarism_detector.py

clean:
	@echo "... Clean ..."
	@rm -rf $(VENV)
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete

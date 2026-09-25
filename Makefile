SHELL := /bin/bash

PYTHON := python3

.PHONY: install run clean

install:
	@$(PYTHON) -c "import sys; print(f'Python {sys.version.split()[0]} found')"

run:
	@$(PYTHON) plagiarism_detector.py

clean:
	@echo "Clean"
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete

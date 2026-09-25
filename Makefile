SHELL := /bin/bash

PYTHON := python3

.PHONY: help install run clean

help: 
	@echo "Commandes disponibles :"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install:
	@echo "Vérification de l'environnement Python..."
	$(PYTHON) -c "import sys; print(f'Version Python : {sys.version.split()[0]}')"
	@echo "Le module 'difflib' est natif, prêt à l'emploi."

run:
	@echo "Lancement de out.py..."
	$(PYTHON) plagiarism_detector.py

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete

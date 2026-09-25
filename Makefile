# Force bash pour exécuter les commandes du Makefile
SHELL := /bin/bash

# Variables du projet
VENV := venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

.PHONY: help install run clean

# -----------------------------------------------------------------
# AIDE
# -----------------------------------------------------------------
help: ## Affiche cette aide
	@echo "Commandes disponibles :"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

# -----------------------------------------------------------------
# INSTALLATION & EXÉCUTION
# -----------------------------------------------------------------
install: ## Crée le venv et affiche l'activation selon le shell
	@echo "Création de l'environnement virtuel..."
	python3 -m venv $(VENV)

	@echo "Mise à jour de pip..."
	$(PIP) install --upgrade pip

	@echo "--------------------------------------------------------"
	@echo "Environnement virtuel créé avec succès !"
	@echo "Pour l'activer manuellement dans votre terminal :"
	@echo "  - Si vous utilisez Fish  : source $(VENV)/bin/activate.fish"
	@echo "  - Si vous utilisez Bash/Zsh : source $(VENV)/bin/activate"
	@echo "--------------------------------------------------------"
	@echo "Note : Le module 'difflib' (SequenceMatcher) est natif à Python."

run: ## Exécute le script principal out.py avec le venv
	@echo "Lancement de out.py..."
	$(PYTHON) out.py

# -----------------------------------------------------------------
# NETTOYAGE
# -----------------------------------------------------------------
clean: ## Nettoie le venv et les caches Python
	rm -rf $(VENV)
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete

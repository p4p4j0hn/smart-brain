.PHONY: dev_init
dev_init: dev_init_frontend dev_init_backend

.PHONY: dev_init_frontend
dev_init_frontend:
	@echo 'Building frontend'
	@devcontainer up --workspace-folder . --config .devcontainer/frontend/devcontainer.json --dotfiles-repository https://github.com/p4p4j0hn/dotfiles

.PHONY: dev_init_backend
dev_init_backend:
	@echo 'Building backend'
	@devcontainer set-up --config .devcontainer/backend/devcontainer.json --container-id smartbrain_backend --dotfiles-repository https://github.com/p4p4j0hn/dotfiles

.PHONY: dev_up_frontend
dev_up_frontend:
	@echo 'Starting frontend container'
	@devcontainer up --workspace-folder . --config .devcontainer/frontend/devcontainer.json

.PHONY: dev_up_backend
dev_up_backend:
	@echo 'Starting backend container'
	@devcontainer set-up --config .devcontainer/backend/devcontainer.json --container-id smartbrain_backend

.PHONY: dev_up
dev_up: dev_up_frontend dev_up_backend

.PHONY: shell_backend
shell_backend:
	@echo 'Shelling into backend'
	@devcontainer exec --config .devcontainer/backend/devcontainer.json --container-id smartbrain_backend bash

.PHONY: shell_frontend
shell_frontend:
	@echo 'Shelling into frontend'
	@devcontainer exec --config .devcontainer/frontend/devcontainer.json --container-id smartbrain_frontend bash

.PHONY: start_backend
start_backend:
	@echo 'Starting backend node server'
	@devcontainer exec --config .devcontainer/backend/devcontainer.json --container-id smartbrain_backend yarn start:dev

.PHONY: start_frontend
start_frontend:
	@echo 'Starting frontend node server'
	@devcontainer exec --config .devcontainer/frontend/devcontainer.json --container-id smartbrain_frontend yarn start

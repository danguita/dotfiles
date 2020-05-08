.PHONY: install
install: dotfiles-install vim-install ## Install dotfiles and vim configuration.

.PHONY: update
update: dotfiles-update vim-update ## Update dotfiles and vim configuration.

.PHONY: clean
clean: dotfiles-clean vim-clean ## Remove dotfiles and vim configuration.

.PHONY: dotfiles-install
dotfiles-install: ## Create symlinks.
	./script/dotfiles.sh install

.PHONY: dotfiles-update
dotfiles-update: ## Update remote.
	./script/dotfiles.sh update

.PHONY: dotfiles-clean
dotfiles-clean: ## Remove symlinks.
	./script/dotfiles.sh clean

.PHONY: vim-install
vim-install: ## Install plugin manager and plugins.
	./script/vim.sh manager_install
	./script/vim.sh plugin_install

.PHONY: vim-update
vim-update: ## Update plugin manager and plugins.
	./script/vim.sh manager_update
	./script/vim.sh plugin_update

.PHONY: vim-clean
vim-clean: ## Remove plugin manager and plugins.
	./script/vim.sh clean

.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

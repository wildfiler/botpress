# Setting up development environment

1. Clone repository

2. Execute `bin/setup`

3. Execute `bin/rails db:populate`

4. Execute `bin/rails server`

# Importing items from bots

Use rake task `data:bot:import` for importing items

Task can do next three type of import

* Import all bot: just run task with no arguments

* Import one bot: `rails data:bot:import[bot,<id>]`

* Import all bots from account: `rails data:bot:import[account,<id>]`

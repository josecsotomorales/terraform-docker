# Terraform Docker
Terraform Docker Examples

### Utils
- Create terraform module folder
```bash
mkdir ./module_name && cd ./module_name && touch main.tf outputs.tf providers.tf variables.tf
```

- Create terraform graph
```bash
terraform graph -draw-cycles | dot -Tsvg > graph.svg
```
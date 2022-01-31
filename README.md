# RTS Project

Example project demonstrating an architecture design and subset of the implementation

Architecture: docs/rts-drawio.pdf

## Testing

Really simple example front-end that generates a dist directory used by the deployment

```bash
cd ui
npm install
npm build
```

Terraform take a `bucket_name` and `domain_name`

```bash
cd terraform
terraform apply
```
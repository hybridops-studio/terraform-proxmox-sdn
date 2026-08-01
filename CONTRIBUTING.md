# Contributing to terraform-proxmox-sdn

Thank you for considering contributing to this project.

---

## How to Contribute

1.Fork the repository.
2.Create a feature branch:

   ```bash
   git checkout -b feature/descriptive-name
   ```

3.Make your changes following the code standards below.
4.Test with `terraform fmt`, `terraform validate`, the root module tests, and (where possible) an actual deployment.
5.Commit your changes:

   ```bash
   git commit -m "Add descriptive message"
   ```

6.Push your branch:

   ```bash
   git push origin feature/descriptive-name
   ```

7.Open a Pull Request (PR) against the `main` branch.

---

## Code Standards

- Follow the official [Terraform style conventions](https://developer.hashicorp.com/terraform/language/syntax/style).
- Run `terraform fmt -recursive` before committing.
- Ensure `terraform validate` passes for all updated modules.
- Update examples if you add, change, or deprecate variables.
- Document user-visible changes in `CHANGELOG.md` where appropriate.
- Keep changes small, focused, and logically grouped.

---

## Testing

### Root module tests

Run the same module tests as CI from the repository root:

```bash
terraform init -backend=false -input=false
terraform test -no-color
```

These tests use mocked providers, so they do not require a live Proxmox
endpoint, real credentials, or other private values.

### Example validation and live testing

Module tests are separate from validating the configurations under `examples/`.
Run `terraform init -backend=false -input=false` and `terraform validate
-no-color` inside each example directory affected by your change.

Where possible, test changes against a real **Proxmox VE 8.x** node.

Example workflow:

```bash
cd examples/basic
terraform init
terraform plan
terraform apply
```

Verify the following (as applicable to your changes):

- SDN zone creation.
- VNet provisioning.
- Subnet configuration.
- DHCP functionality (if enabled).

Destroy test resources when finished:

```bash
terraform destroy
```

---

## Reporting Issues

If you encounter a problem, please submit an issue via **GitHub Issues** and include:

- Clear description of the problem.
- Terraform version (`terraform version`).
- Proxmox VE version.
- Relevant configuration snippets (sanitised).
- Error messages or logs (redacted as needed).
- Steps to reproduce the issue.

Well-scoped, reproducible issues are much easier to resolve quickly.

---

## Pull Request Guidelines

- Reference related issues in the PR description (for example, `Fixes #123`).
- Describe what the change does and why it is needed.
- Include test results or screenshots/logs where relevant.
- Update documentation (README, examples, comments) for new or changed behaviour.
- Avoid mixing unrelated refactors with feature or bug-fix PRs.
- Be responsive to review feedback and comments.

---

## Questions and Discussions

If you have questions or want to propose an idea before implementing it, open a **GitHub Issue** with a suitable label (for example, `question` or `discussion`).

Constructive feedback and suggestions are very welcome.

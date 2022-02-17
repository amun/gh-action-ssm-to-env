# SSM path to environment variables in Github job.
Used as a step to inject all env variables found in given path, to be used by all steps in GH Workflow job.

Retrieves all parameters in given path and masks values with * if printed to stdout.

# Usage in job manifest

```sh
      - name: Get and set envs from ssm
        uses: amun/gh-action-ssm-to-env@v1
        with:
          ssm-path: '/your/ssm/path/'
```
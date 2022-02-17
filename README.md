# SSM path to environment variables in Github job.
Used as a step to inject all env variables found in given path, to be used by all steps in GH Workflow job.

Retrieves all parameters in given path and masks values with * if printed to stdout.

# Usage in job manifest
AWS Credentials has to set before using this action.



```sh
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID_STAGING }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY_STAGING }}
          aws-region: us-east-1

      - name: Get and set envs from ssm
        uses: amun/gh-action-ssm-to-env@v1
        with:
          ssm-path: '/your/ssm/path/'
```

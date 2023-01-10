# Deploy Terraform using GitHub Actions to Azure #
this will store the statefile in a different storageaccount in a different rg than the "main" deployment

Steps:
1. Run the pre_deployment.azcli file (change rg, location and storagename if you want)
2. Save Service Principal credentials within GitHub Repository as secrets, se pre_deploymnet file
3. change the backend in main.tf file to the same names as in the pre_deployment file
4. change rg and location (if you want) in the main.tf file
5. if you want you can change workflow_dispatch: to push: in the main.yml file to push changes directly instead of manually.

<h1>AWS Cloud Resume</h1>

<h6>Route 53 | Cloudfront | S3 | Certificate Manager | Lambda function | DynamoDB | Git | Github | Terraform | Python | Javascript </h6> 

<h2>About The Project:</h2>
A simple full-stack serverless resume built within AWS. Within an S3 bucket lies the website along with a profile counter tied to a Lambda function + Function URL that is called only from the resume's domain to DynamoDB and updates the respective table and DOM element. 
On the Front End we have Route53 handling DNS, and CloudFront to take care of HTTPS and Edge Caching. A CI/CD pipeline has been setup using Github Actions to automatically update the website within S3, and invalidate Cloud Terraform has been used as IAC, and but few variables and adjustments are need to spin the entire architecture up.


![{EA9C8906-ABED-40BA-91DC-E5AAB4A34FC6}](https://github.com/user-attachments/assets/e9b6656b-2091-415b-95e7-ac4c10c9fdcf)

<h2>Structure</h2>

- `.github/workflows/`: Folder contains CI/CD workflow configurations.
- `Website/`: Folder contains the website.
    - `index.html`: File contains frontend website code.
    - `assets/js/main.js`: Contains visitor counter code to retrieve & update the resume view counter.
- `infrastructure/`: Contains the infrastructure code.
    - `main.tf`: Contains the backend infrastructure written as terraform code.
 - `src/func.py`: Contains the visitor counter code which is deployed on lambda function.


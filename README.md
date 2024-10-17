<h1>AWS Cloud Resume</h1>

<h6>Route 53 | Cloudfront | S3 | Certificate Manager | Lambda function | DynamoDB | Git | Github | Terraform | Python | Javascript </h6> 

<h2>About The Project:</h2>
A simple full-stack serverless resume built within AWS. Within an S3 bucket lies the website along with a resume view counter tied to a Lambda Function + Function URL that can be called only from the resume's domain to DynamoDB and updates the respective table and DOM element. 
On the Front End we have Route53 handling DNS, and CloudFront to take care of HTTPS and Edge Caching. A CI/CD pipeline has been setup using Github Actions to automatically update the website within S3, and invalidate CloudFront. Terraform has been used as IAC, and but few variables and adjustments are needed to spin the entire architecture up.


![{EA9C8906-ABED-40BA-91DC-E5AAB4A34FC6}](https://github.com/user-attachments/assets/e9b6656b-2091-415b-95e7-ac4c10c9fdcf)

<h2>Structure</h2>

- `.github/workflows/`: Folder contains CI/CD workflow configurations.
- `Website/`: Folder contains the website.
    - `index.html`: File contains frontend website code.
    - `assets/js/main.js`: Contains visitor counter code to retrieve & update the resume view counter.
- `infrastructure/`: Contains the infrastructure code.
    - `main.tf`: Contains the backend infrastructure written as terraform code.
 - `src/func.py`: Contains the visitor counter code which is deployed on lambda function.

<h2>Variables:</h2>
The primary variables needed to get this architecture spun-up are:

```
variable "s3_bucket_name" {
  description = "Primary Bucket name"
  default     = N/A
  type        = string
}

variable "domain" {
  description = "website domain. Used with CORS to access lambda function url."
  default     = N/A
  type        = string
}

variable "hosted_zone_id" {
  description = "Previously created Hosted Zone ID within Route 53."
  default     = N/A
  type        = string
}

variable "cert_arn" {
  description = "Cert arn via Certificate Manager"
  default     = N/A
  type        = string
}
```
 
- You'll need to place the respective Lambda Function URL within your Javascript code, once generated from a terraform apply. outputs.tf should populate this for you upon the terraform apply.
- Place you website into your S3 bucket once the bucket has been generated.
- Ensure that your "default_root_object = "index.html" on line 28 is set properly, as well as "handler = "func.lambda_handler" on line 111 with respect to yourwebsite root and .py, as these are required to ensure your website can be pulled up, and Lambda runs. 
- Configure AWS credentials via TF, or through your CLI.

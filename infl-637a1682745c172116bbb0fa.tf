resource "aws_iam_policy" "product-S3SpecificReadPermission-25f" {
  name   = "product-S3SpecificReadPermission"
  policy = jsonencode({
  "Statement": [
    {
      "Action": [
        "kms:Decrypt"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kms:*:604474584231:key/*"
    },
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Deny",
      "NotResource": [
        "arn:aws:s3:::*/*tfstate",
        "arn:aws:s3:::elasticbeanstalk*/*",
        "arn:aws:s3:::aws-emr-resources*/*",
        "arn:aws:s3:::*/604474584231*ConfigSnapshot*.json.gz"
      ]
    }
  ],
  "Version": "2012-10-17"
  })
}


resource "aws_s3_bucket" "site" {
    bucket = "${var.bucket_name}"
    acl    = "public-read"
    website {
        index_document = "index.html"
        error_document = "index.html"
    }
}

resource "aws_s3_bucket_policy" "prod_website" {  
  bucket = aws_s3_bucket.site.id
  policy = <<POLICY
{    
    "Version": "2012-10-17",    
    "Statement": [        
      {            
          "Sid": "PublicReadGetObject",            
          "Effect": "Allow",            
          "Principal": "*",            
          "Action": [                
             "s3:GetObject"            
          ],            
          "Resource": [
             "arn:aws:s3:::${aws_s3_bucket.site.id}/*"            
          ]        
      }    
    ]
}
POLICY
}

## TODO add MIME lookup to turn this into 1 loop

resource "aws_s3_bucket_object" "html" {
    for_each = fileset("../ui/dist/", "*.html")
    bucket = aws_s3_bucket.site.id
    key = each.value
    source = "../ui/dist/${each.value}"
    etag = filemd5("../ui/dist/${each.value}")
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "png" {
    for_each = fileset("../ui/dist/", "*.png")
    bucket = aws_s3_bucket.site.id
    key = each.value
    source = "../ui/dist/${each.value}"
    etag = filemd5("../ui/dist/${each.value}")
    content_type = "image/png"
}

resource "aws_s3_bucket_object" "map" {
    for_each = fileset("../ui/dist/", "*.map")
    bucket = aws_s3_bucket.site.id
    key = each.value
    source = "../ui/dist/${each.value}"
    etag = filemd5("../ui/dist/${each.value}")
    content_type = "application/json"
}

resource "aws_s3_bucket_object" "js" {
    for_each = fileset("../ui/dist/", "*.js")
    bucket = aws_s3_bucket.site.id
    key = each.value
    source = "../ui/dist/${each.value}"
    etag = filemd5("../ui/dist/${each.value}")
    content_type = "text/javascript"
}

